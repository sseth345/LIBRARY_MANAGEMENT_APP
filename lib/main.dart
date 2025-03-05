import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/login_page.dart';
import 'screens/user_home.dart';
import 'screens/admin_home.dart';
import 'screens/book_list.dart'; // Import Book List Screen
import 'screens/book_details.dart';
import 'screens/welcome_page.dart';
import 'screens/home_page.dart';
import 'screens/browse_books_page.dart';
import 'screens/rent_books_page.dart';
import 'screens/book_seat_page.dart'; // Import BookSeatPage

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://tfakarmhzmaxtwjwrafn.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRmYWthcm1oem1heHR3andyYWZuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDAwNzIxOTcsImV4cCI6MjA1NTY0ODE5N30.noQzxfPXqNO15t6IUCwN-RlYi_EzzMR60AJScs2OIB0',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Start with the login page
      routes: {
        '/': (context) => LoginPage(),
        '/userHome': (context) => UserHome(),
        '/welcome': (context) => WelcomePage(),
        '/adminHome': (context) => AdminHome(),
        '/bookList': (context) => BookList(),
        '/home': (context) => HomePage(), // HomePage route
        '/bookDetails': (context) => BookDetails(bookId: '1'),
        '/browse': (context) => BrowseBooksPage(),
        '/rent': (context) => RentBooksPage(),
        '/bookSeat': (context) => BookSeatPage(), // BookSeatPage route
      },
    );
  }
}
