import 'package:flutter/cupertino.dart';
import 'package:remindly/product/models/note/note.dart';
import 'package:remindly/product/services/local_storage_service.dart';

class NoteProvider with ChangeNotifier {
  LocalStorageService storageService = LocalStorageService();
  Note? currentNote;
  List<Note>? allNotes;

  void addNote(Note newNote) {
    if (allNotes == null) {
      allNotes = [newNote];
    } else {
      allNotes?.add(newNote);
    }
    storageService.writeNote(allNotes ?? []);
    notifyListeners();
  }

  void updateNote(Note note) {
    var noteIndex = allNotes!.indexWhere((element) => element.id == note.id);
    allNotes!.removeWhere((element) => element.id == note.id);
    allNotes!.insert(noteIndex, note);
    storageService.writeNote(allNotes ?? []);
    notifyListeners();
  }

  void deleteNote(Note note) {
    allNotes?.removeWhere((element) => element.id == note.id);
    storageService.writeNote(allNotes ?? []);
    notifyListeners();
  }

  void fetchNotes() async {
    var response = await storageService.fetchNotes();
    allNotes = response;
    notifyListeners();
  }
}
