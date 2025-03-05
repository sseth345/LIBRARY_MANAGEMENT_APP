import 'package:flutter/material.dart';

class AddEditBook extends StatefulWidget {
  final String? bookId;

  AddEditBook({this.bookId});

  @override
  _AddEditBookState createState() => _AddEditBookState();
}

class _AddEditBookState extends State<AddEditBook> {
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bookId == null ? 'Add Book' : 'Edit Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _authorController,
              decoration: InputDecoration(labelText: 'Author'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add or edit book in the database
              },
              child: Text(widget.bookId == null ? 'Add Book' : 'Edit Book'),
            ),
          ],
        ),
      ),
    );
  }
}
