import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../notes_flow.dart';
import '../notes_page/notes_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notesChanger = Provider.of<NotesChanger>(context);
    final notes = notesChanger.notes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notes App'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return ListTile(
            title: Text(note.title),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NotesPage(note: note),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const NotesPage(),
            ),
          );
        },
      ),
    );
  }
}