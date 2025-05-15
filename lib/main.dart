import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Added const and key

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Subjects App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true, // Optional: modern Material 3 design
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
