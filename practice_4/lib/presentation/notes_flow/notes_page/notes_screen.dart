import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home_page/home_screen.dart';
import '../notes_flow.dart';

class NotesScreen extends StatefulWidget {
  final Note? note;
  const NotesScreen({super.key, this.note});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final _titleController = TextEditingController();
  final _infoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _infoController.text = widget.note!.info;
    }
  }

  void _saveNote() {
    final title = _titleController.text;
    final info = _infoController.text;

    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Необходимо ввести название')),
      );
      return;
    }

    final notesProvider = Provider.of<NotesChanger>(context, listen: false);

    if (widget.note == null) {
      notesProvider.addNote(title, info);
    } else {
      notesProvider.updateNote(
        widget.note!.title,
        widget.note!.info,
        title,
        info,
      );
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Заметка сохранена')),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  void _deleteNote() {
    final title = _titleController.text;
    final info = _infoController.text;

    if (title.isNotEmpty || info.isNotEmpty) {
      final notesProvider = Provider.of<NotesChanger>(context, listen: false);
      notesProvider.deleteNote(title, info);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Заметка успешно удалена')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Нечего удалять')),
      );
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? 'Добавить заметку' : 'Редактировать заметку'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Название'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _infoController,
              decoration: const InputDecoration(labelText: 'Дополнительная информация'),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _saveNote,
                  child: const Text('Сохранить'),
                ),
                ElevatedButton(
                  onPressed: _deleteNote,
                  child: const Text('Удалить'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}