import 'package:flutter/material.dart';

class RentBooksPage extends StatefulWidget {
  const RentBooksPage({super.key});

  @override
  _RentBooksPageState createState() => _RentBooksPageState();
}

class _RentBooksPageState extends State<RentBooksPage> {
  List<Map<String, String>> books = [
    {
      "title": "1984",
      "author": "George Orwell",
      "image": "assets/images/1984.jpg",
      "category": "Novels",
      "available": "Yes"
    },
    {
      "title": "To Kill a Mockingbird",
      "author": "Harper Lee",
      "image": "assets/images/to_kill_a_mockingbird.jpg",
      "category": "Novels",
      "available": "No"
    },
    {
      "title": "Journal of Modern Physics",
      "author": "Various",
      "image": "assets/images/journal_modern_physics.jpg",
      "category": "Journals",
      "available": "Yes"
    },
    {
      "title": "Journal of Artificial Intelligence",
      "author": "Various",
      "image": "assets/images/journal_ai.png",
      "category": "Journals",
      "available": "Yes"
    },
    {
      "title": "Calculus: Early Transcendentals",
      "author": "James Stewart",
      "image": "assets/images/calculus.jpg",
      "category": "Course-related",
      "available": "No"
    },
    {
      "title": "Introduction to Algorithms",
      "author": "Thomas H. Cormen",
      "image": "assets/images/algorithms.jpg",
      "category": "Course-related",
      "available": "Yes"
    },
    {
      "title": "Artificial Intelligence: A Modern Approach",
      "author": "Stuart Russell",
      "image": "assets/images/ai_modern_approach.jpg",
      "category": "Course-related",
      "available": "Yes"
    },
    {
      "title": "Digital Signal Processing",
      "author": "John G. Proakis",
      "image": "assets/images/dsp.jpg",
      "category": "Course-related",
      "available": "No"
    }
  ];

  String? selectedBookTitle;
  String bookAvailability = "Select a book to check availability";
  TextEditingController _daysController = TextEditingController();
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> filteredBooks = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      filterBooks(_searchController.text);
    });
  }

  @override
  void dispose() {
    _daysController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void filterBooks(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredBooks = [];
      } else {
        filteredBooks = books.where((book) {
          return book['title']!.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  void checkAvailability(String title) {
    final book = books.firstWhere((book) => book["title"] == title);
    setState(() {
      bookAvailability = book["available"]!;
    });
  }

  void rentBook() {
    if (selectedBookTitle != null && _daysController.text.isNotEmpty) {
      final days = _daysController.text;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "You have rented '$selectedBookTitle' for $days days."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rent Books'),
        backgroundColor: Color(0xFFFEFAE0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Books',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: filteredBooks.length,
                itemBuilder: (context, index) {
                  final book = filteredBooks[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    color: Color(0xFFD4A373),
                    child: ListTile(
                      leading: Image.asset(book['image']!, width: 50),
                      title: Text(
                        book['title']!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(book['author']!),
                      trailing: Icon(Icons.book, color: Colors.black),
                      onTap: () {
                        setState(() {
                          selectedBookTitle = book["title"];
                        });
                        checkAvailability(book["title"]!);
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 8.0),
            Text(bookAvailability),
            SizedBox(height: 16.0),
            TextField(
              controller: _daysController,
              decoration: InputDecoration(
                labelText: "Number of Days",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFD4A373),
                foregroundColor: Colors.black,
              ),
              onPressed: rentBook,
              child: Text("Rent Book"),
            ),
          ],
        ),
      ),
    );
  }
}
