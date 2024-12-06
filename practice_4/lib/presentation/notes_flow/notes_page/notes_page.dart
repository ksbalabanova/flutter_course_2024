import 'package:flutter/material.dart';
import 'notes_screen.dart';
import '../notes_flow.dart';

class NotesPage extends StatelessWidget {
  final Note? note;

  const NotesPage({super.key, this.note});

  @override
  Widget build(BuildContext context) {
    return NotesScreen(note: note);
  }
}