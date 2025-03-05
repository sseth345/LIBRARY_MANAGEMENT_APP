import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  final String bookId;

  BookDetails({required this.bookId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: Book Title', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Author: Author Name', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Description: Book description goes here.', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
