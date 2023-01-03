import 'package:flutter/cupertino.dart';
import 'package:remindly/product/models/note/note.dart';

class NoteProvider with ChangeNotifier {
  Note? currentNote;
  List<Note>? allNotes;

  void addNote(Note newNote) {
    if (allNotes == null) {
      allNotes = [newNote];
    } else {
      allNotes?.add(newNote);
    }
    notifyListeners();
  }

  void updateNote(Note note) {
    var noteIndex = allNotes!.indexWhere((element) => element.id == note.id);
    allNotes!.removeWhere((element) => element.id == note.id);
    allNotes!.insert(noteIndex, note);
    notifyListeners();
  }

  void deleteNote(Note note) {
    allNotes?.removeWhere((element) => element.id == note.id);
    notifyListeners();
  }
}
