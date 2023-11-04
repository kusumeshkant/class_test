import 'package:flutter/material.dart';
import 'package:noteapp/note_ui/createNote.dart';
import 'package:noteapp/note_ui/noteUi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => NoteUi(),
        "createNote": (context) => CreateNoteUi()
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: NoteUi(),
    );
  }
}
