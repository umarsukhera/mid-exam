import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'view.dart';

void main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // <-- initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Text Submit',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ViewPage(),
    );
  }
}
