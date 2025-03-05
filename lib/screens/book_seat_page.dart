import 'package:flutter/material.dart';
import 'dart:math'; // Import dart:math for random number generation

class BookSeatPage extends StatefulWidget {
  const BookSeatPage({super.key});

  @override
  _BookSeatPageState createState() => _BookSeatPageState();
}

class _BookSeatPageState extends State<BookSeatPage> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  int seatsLeft = Random().nextInt(100) + 1; // Generate random number for seats left
  String _selectedType = 'Seat'; // Default selection
  String _selectedAmPm = 'AM'; // Default AM/PM

  void bookSeat() {
    final random = Random();
    String bookedNumber;

    if (_selectedType == 'Seat') {
      bookedNumber = (random.nextInt(1000) + 1).toString(); // Random seat number 1-1000
    } else if (_selectedType == 'Conference Room') {
      bookedNumber = (random.nextInt(5) + 1).toString(); // Random conference room number 1-5
    } else {
      bookedNumber = (random.nextInt(10) + 1).toString(); // Random study room number 1-10
    }

    final dateTime = _dateController.text + ' ' + _timeController.text + ' ' + _selectedAmPm;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$_selectedType $bookedNumber booked for $dateTime!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFAEDCD),
        title: Text(
          'Book',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Tile for seats left
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(bottom: 16.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFD4A373),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                '$seatsLeft seats left',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Tile for conference rooms
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(bottom: 16.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFD4A373),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                '2 conference rooms empty',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Tile for study room
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(bottom: 16.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFD4A373),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                '1 study room empty',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            DropdownButton<String>(
              value: _selectedType,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedType = newValue!;
                });
              },
              items: <String>['Seat', 'Conference Room', 'Study Room']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              isExpanded: true,
              hint: Text('Select Type'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Date (dd-mm-yyyy)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.datetime,
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: _timeController,
                    decoration: InputDecoration(
                      labelText: 'Time (--:--)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  flex: 1,
                  child: DropdownButton<String>(
                    value: _selectedAmPm,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedAmPm = newValue!;
                      });
                    },
                    items: <String>['AM', 'PM']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    isExpanded: true,
                    hint: Text('Select AM/PM'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFD4A373),
                foregroundColor: Colors.black,
              ),
              onPressed: bookSeat,
              child: Text('Book'),
            ),
          ],
        ),
      ),
    );
  }
}
