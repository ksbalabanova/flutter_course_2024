import 'package:flutter/material.dart';

class Note {
  String title;
  String info;

  Note({
    required this.title,
    required this.info,
  });
}

class NotesChanger with ChangeNotifier {
  final List<Note> _notes = [];

  List<Note> get notes => _notes;

  void addNote(String title, String info) {
    final note = Note(
      title: title,
      info: info,
    );
    _notes.add(note);
    notifyListeners();
  }

  void updateNote(String oldTitle, String oldInfo, String newTitle, String newInfo) {
    final index = _notes.indexWhere(
            (note) => note.title == oldTitle && note.info == oldInfo);
    if (index != -1) {
      _notes[index] = Note(
        title: newTitle,
        info: newInfo,
      );
      notifyListeners();
    }
  }

  void deleteNote(String title, String info) {
    _notes.removeWhere((note) => note.title == title && note.info == info);
    notifyListeners();
  }
}