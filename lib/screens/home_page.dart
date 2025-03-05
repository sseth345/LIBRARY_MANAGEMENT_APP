import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../custom_carousel_slider.dart';
import 'about_us_page.dart';  // Import the About Us page

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final supabase = Supabase.instance.client;
  final List<String> imagePaths = [
    'assets/images/library_1.jpg',
    'assets/images/library_2.jpg',
    'assets/images/library_3.jpg',
  ];
  bool _isSearchActive = false;
  TextEditingController _searchController = TextEditingController();

  void _logout(BuildContext context) async {
    await supabase.auth.signOut();
    Navigator.pushReplacementNamed(context, '/');
  }

  void _toggleSearch() {
    setState(() {
      _isSearchActive = !_isSearchActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFAEDCD),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/title_logo.jpg',
              fit: BoxFit.contain,
              height: 32,
            ),
            SizedBox(width: 8),
            Text(
              'IntelliLIB',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: _toggleSearch,
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFD4A373),
              ),
              child: Text(
                'Welcome, User!',
                style: TextStyle(
                  color: Color(0xFFF8F6F0),
                  fontSize: 24,
                ),
              ),
            ),


            ListTile(
              leading: Icon(Icons.explore, color: Colors.black),
              title: Text('Browse', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pushNamed(context, '/browse');

              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart, color: Colors.black),
              title: Text('Rent', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pushNamed(context, '/rent');

              },
            ),

            ListTile(
              leading: Icon(Icons.event_seat, color: Colors.black),
              title: Text('Book a Seat', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pushNamed(context, '/bookSeat');

              },
            ),
            ListTile(
              leading: Icon(Icons.info, color: Colors.black),
              title: Text('About Us', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.black),
              title: Text('Logout', style: TextStyle(color: Colors.black)),
              onTap: () {
                _logout(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Color(0xFFF8F6F0),
        child: Column(
          children: <Widget>[
            if (_isSearchActive)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Enter book/author name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            SizedBox(height: 3),
            CarouselSlider(
              options: CarouselOptions(
                height: 250.0,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(seconds: 2),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                enableInfiniteScroll: true, // Loop back to first image
              ),
              items: imagePaths.map((path) {
                return Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          path,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Stack(
              children: <Widget>[
                Center(
                  child: Image.asset(
                    'assets/images/behind_logo.jpg', // Path to your college logo
                    fit: BoxFit.cover,
                    height: 100, // Adjust as needed
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  width: MediaQuery.of(context).size.width * 0.8, // Reduce horizontal length
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD4A373), // Button color
                      foregroundColor: Colors.black, // Text color
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Curved rectangle
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/browse');
                    },

                    child: Text('Browse'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  width: MediaQuery.of(context).size.width * 0.8, // Reduce horizontal length
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD4A373), // Button color
                      foregroundColor: Colors.black, // Text color
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Curved rectangle
                      ),
                    ),
                    onPressed: () {
                      // Navigate to Rent page
                      Navigator.pushNamed(context, '/rent');

                    },
                    child: Text('Rent'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  width: MediaQuery.of(context).size.width * 0.8, // Reduce horizontal length
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD4A373), // Button color
                      foregroundColor: Colors.black, // Text color
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Curved rectangle
                      ),
                    ),
                    onPressed: () {
                      // Navigate to Request page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutUsPage()),
                      );
                    },
                    child: Text('About Us'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  width: MediaQuery.of(context).size.width * 0.8, // Reduce horizontal length
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD4A373), // Button color
                      foregroundColor: Colors.black, // Text color
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Curved rectangle
                      ),
                    ),
                    onPressed: () {
                      // Navigate to Book a Seat page
                      Navigator.pushNamed(context, '/bookSeat');
                    },
                    child: Text('Book a Seat'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}
