import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'event_modal.dart';
// Import your Event model

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'events.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE events('
              'id INTEGER PRIMARY KEY AUTOINCREMENT,'
              'title TEXT,'
              'description TEXT,'
              'date TEXT,'
              'time TEXT,'
              'location TEXT,'
              'capacity INTEGER'
              ')',
        );
      },
    );
  }

  Future<void> insertEvent(Event event) async {
    final db = await database;
    await db.insert(
      'events',
      event.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Event>> getEvents() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('events');

    return List.generate(maps.length, (i) {
      return Event.fromMap(maps[i]);
    });
  }
}
