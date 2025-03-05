import 'package:flutter/material.dart';

class BookList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book List')),
      body: ListView.builder(
        itemCount: 10, // Replace with the actual number of books
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Book Title $index'),
            subtitle: Text('Author $index'),
            onTap: () {
              // Navigate to book details
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add/edit book screen
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
