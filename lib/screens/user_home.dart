import 'package:flutter/material.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('IntelliLib', style: TextStyle(fontSize: 24)),
            Image.network(
              'https://lookaside.fbsbx.com/lookaside/crawler/media/?media_id=100064716877149',
              height: 50,
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://chennai.vit.ac.in/wp-content/uploads/2020/04/Library.jpg',
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Home',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
