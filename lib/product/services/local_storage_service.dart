import 'dart:convert';

import 'package:hive/hive.dart';

import '../models/note/note.dart';

class LocalStorageService {
  Future<void> writeNote(List<Note> noteList) async {
    var box = await Hive.openBox("notes");
    await box.delete("allNotes");
    var listJson = jsonEncode(noteList.map((e) => e.toJson()).toList());

    await box.put("allNotes", listJson);
  }

  Future<List<Note>> fetchNotes() async {
    var box = await Hive.openBox("notes");
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
