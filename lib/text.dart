import 'package:flutter/material.dart';
import 'helperfile.dart';  // import helper

class TextEntryScreen extends StatefulWidget {
  @override
  _TextEntryScreenState createState() => _TextEntryScreenState();
}

class _TextEntryScreenState extends State<TextEntryScreen> {
  final DataHelper _dataHelper = DataHelper();
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> storedTexts = [];

  @override
  void initState() {
    super.initState();
    _loadTexts();
  }

  Future<void> _loadTexts() async {
    final texts = await _dataHelper.getTexts();
    setState(() {
      storedTexts = texts;
    });
  }

  Future<void> _saveText() async {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      await _dataHelper.insertText(text);
      _controller.clear();
      _loadTexts();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _dataHelper.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Entry Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter some text',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _saveText,
              child: Text('Save to Local Storage'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: storedTexts.isEmpty
                  ? Center(child: Text('No saved texts yet.'))
                  : ListView.builder(
                itemCount: storedTexts.length,
                itemBuilder: (context, index) {
                  final item = storedTexts[index];
                  return Card(
                    child: ListTile(
                      title: Text(item['text']),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
