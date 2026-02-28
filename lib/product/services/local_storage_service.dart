import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

import '../models/note/note.dart';

class LocalStorageService {
  Future<Box> _openEncryptedBox() async {
    const secureStorage = FlutterSecureStorage();
    var containsEncryptionKey = await secureStorage.containsKey(key: 'key');
    if (!containsEncryptionKey) {
      var key = Hive.generateSecureKey();
      await secureStorage.write(key: 'key', value: base64UrlEncode(key));
    }

    var encryptionKey =
        base64Url.decode((await secureStorage.read(key: 'key'))!);
    return await Hive.openBox('notes',
        encryptionCipher: HiveAesCipher(encryptionKey));
  }

  Future<void> writeNote(List<Note> noteList) async {
    var box = await _openEncryptedBox();
    await box.delete("allNotes");
    var listJson = jsonEncode(noteList.map((e) => e.toJson()).toList());

    await box.put("allNotes", listJson);
  }

  Future<List<Note>> fetchNotes() async {
    var box = await _openEncryptedBox();
    var response = await box.get("allNotes");
    if (response != null) {
      List<dynamic> listJson = jsonDecode(response);
      var list = listJson.map((e) => Note.fromJson(e)).toList();
      return list;
    } else {
      return [];
    }
  }
}
