import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataHelper {
  static final DataHelper _instance = DataHelper._internal();
  factory DataHelper() => _instance;
  DataHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'texts.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE texts(id INTEGER PRIMARY KEY AUTOINCREMENT, text TEXT)',
        );
      },
    );
  }

  Future<List<Map<String, dynamic>>> getTexts() async {
    final db = await database;
    return await db.query('texts', orderBy: 'id DESC');
  }

  Future<int> insertText(String text) async {
    final db = await database;
    return await db.insert('texts', {'text': text});
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}
