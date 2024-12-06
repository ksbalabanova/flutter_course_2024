import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/notes_flow/notes_flow.dart';
import 'presentation/notes_flow/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotesChanger(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Notes App',
        theme: ThemeData(primarySwatch: Colors.pink),
        home: const HomePage(),
      ),
    );
  }
}
