import 'dart:io';
import 'package:path/path.dart' show join;
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;

class DatabaseHelper {
  static final _databaseName = "tarot.db";
  static final _databaseVersion = 1;

  static final table = 'tcards';

  static final columnId = 'id';
  static final columnTitle = 'title';
  static final columnDesc = 'desc';
  static final columnImage = 'image';

  // make this a singleton class
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    print('****** pre init database');
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "assets_tarot.db");

    ByteData data = await rootBundle.load(join('assets', 'tarot.db'));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await new File(path).writeAsBytes(bytes);

    var ourDb = await openDatabase(path);
    return ourDb;
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    /*await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnTitle TEXT NOT NULL,
            $columnDesc Text NOT NULL,
            $columnImage Text NOT NULL
          )
          ''');

    // prepopulate a few rows (consider using a transaction)
    await db.rawInsert('INSERT INTO $table ($columnTitle, $columnDesc) VALUES("Шут", "Шут desc")');
    await db.rawInsert('INSERT INTO $table ($columnTitle, $columnDesc) VALUES("Маг", "Маг desc")');
    await db.rawInsert('INSERT INTO $table ($columnTitle, $columnDesc) VALUES("Жрица", "Жрица desc")');*/
    print('_onCreate database');
  }
}
