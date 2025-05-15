import 'package:flutter/material.dart';
import 'text.dart';  // import the new screen

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> subjects = [
    {
      'subject': 'Computer Science',
      'teacher': 'Mr. Ali Khan',
      'credit': '3',
    },
    {
      'subject': 'Mathematics',
      'teacher': 'Mrs. Sana Ahmed',
      'credit': '4',
    },
    {
      'subject': 'Physics',
      'teacher': 'Dr. Hamid Raza',
      'credit': '3',
    },
    {
      'subject': 'English',
      'teacher': 'Ms. Ayesha Siddiqui',
      'credit': '2',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Subjects App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // just close drawer, stay on home
              },
            ),
            ListTile(
              leading: Icon(Icons.note_add),
              title: Text('Text Entry'),
              onTap: () {
                Navigator.pop(context); // close drawer first
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TextEntryScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Image.asset(
            'assets/img_2.png',
            height: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: subjects.length,
              itemBuilder: (context, index) {
                final subject = subjects[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  elevation: 4,
                  child: ListTile(
                    title: Text(subject['subject']!),
                    subtitle: Text('Teacher: ${subject['teacher']}'),
                    trailing: Text('${subject['credit']} CH'),
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
