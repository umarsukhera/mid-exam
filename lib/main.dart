import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'view.dart'; // import the other file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Text Submit',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ViewPage(),
    );
  }
}
