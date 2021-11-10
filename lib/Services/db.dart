import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:fincontrol/Models/model.dart';
import 'dart:convert';

abstract class DB {

  static Database? _db;
  Future<Database> get database async =>
      _db ??= await init();

  static int get _version => 1;

  static Future<Database> init() async {
    String _path = await getDatabasesPath() + 'testfincontrol';
    return  await openDatabase(_path, version: _version, onCreate: onCreate);
  }

  static void onCreate(Database db, int version) async =>
      await db.execute('CREATE TABLE cards (id INTEGER PRIMARY KEY NOT NULL, content STRING, additionalInfo STRING)');

  static Future<List<Map<String, dynamic>>> query(String table) async => _db!.query(table);

  static Future<int> insert(String table, Model model) async =>
      await _db!.insert(table, model.toMap());

  static Future<int> update(String table, Model model) async =>
      await _db!.update(table, model.toMap(), where: 'id = ?', whereArgs: [model.id]);

  static Future<int> delete(String table, Model model) async =>
      await _db!.delete(table, where: 'id = ?', whereArgs: [model.id]);

}