import 'package:flutter/material.dart';

class CreateNoteUi extends StatefulWidget {
  const CreateNoteUi({super.key});

  @override
  State<CreateNoteUi> createState() => _CreateNoteUiState();
}

class _CreateNoteUiState extends State<CreateNoteUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "Create Note",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 15, right: 20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text("Type you contecnt here ....")
          ],
        ),
      ),
    );
  }
}
