import 'package:flutter/material.dart';

class BrowseBooksPage extends StatefulWidget {
  const BrowseBooksPage({super.key});

  @override
  _BrowseBooksPageState createState() => _BrowseBooksPageState();
}

class _BrowseBooksPageState extends State<BrowseBooksPage> {
  List<Map<String, String>> books = [
    {
      "title": "1984",
      "author": "George Orwell",
      "image": "assets/images/1984.jpg",
      "category": "Novels"
    },
    {
      "title": "To Kill a Mockingbird",
      "author": "Harper Lee",
      "image": "assets/images/to_kill_a_mockingbird.jpg",
      "category": "Novels"
    },
    {
      "title": "Journal of Modern Physics",
      "author": "Various",
      "image": "assets/images/journal_modern_physics.jpg",
      "category": "Journals"
    },
    {
      "title": "Journal of Artificial Intelligence",
      "author": "Various",
      "image": "assets/images/journal_ai.png",
      "category": "Journals"
    },
    {
      "title": "Calculus: Early Transcendentals",
      "author": "James Stewart",
      "image": "assets/images/calculus.jpg",
      "category": "Course-related"
    },
    {
      "title": "Introduction to Algorithms",
      "author": "Thomas H. Cormen",
      "image": "assets/images/algorithms.jpg",
      "category": "Course-related"
    },
    {
      "title": "Artificial Intelligence: A Modern Approach",
      "author": "Stuart Russell",
      "image": "assets/images/ai_modern_approach.jpg",
      "category": "Course-related"
    },
    {
      "title": "Digital Signal Processing",
      "author": "John G. Proakis",
      "image": "assets/images/dsp.jpg",
      "category": "Course-related"
    }
  ];

  List<Map<String, String>> filteredBooks = [];
  String selectedCategory = 'All';
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredBooks = books;
    _searchController.addListener(() {
      filterBooksBySearch(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void filterBooks(String category) {
    setState(() {
      selectedCategory = category;
      filterBooksBySearch(_searchController.text);
    });
  }

  void filterBooksBySearch(String query) {
    List<Map<String, String>> tempList = books;
    if (selectedCategory != 'All') {
      tempList = tempList.where((book) => book['category'] == selectedCategory).toList();
    }
    setState(() {
      if (query.isEmpty) {
        filteredBooks = tempList;
      } else {
        filteredBooks = tempList.where((book) {
          return book['title']!.toLowerCase().contains(query.toLowerCase()) ||
              book['author']!.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Browse Books'),
        backgroundColor: Color(0xFFFEFAE0),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Search',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
                SizedBox(height: 8.0),
                DropdownButton<String>(
                  value: selectedCategory,
                  onChanged: (String? newValue) {
                    filterBooks(newValue!);
                  },
                  items: <String>['All', 'Course-related', 'Novels', 'Journals']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: filteredBooks.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  color: Color(0xFFD4A373),
                  child: ListTile(
                    leading: Image.asset(filteredBooks[index]['image']!, width: 50),
                    title: Text(
                      filteredBooks[index]['title']!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(filteredBooks[index]['author']!),
                    trailing: Icon(Icons.book, color: Colors.black),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
