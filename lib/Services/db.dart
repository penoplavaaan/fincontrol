import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:fincontrol/Models/model.dart';
import 'dart:convert';


class DB{

  Database _db;
  String _dbName;
  String _tableName;
  String _onCreateString;

  DB(
      this._db,
      this._dbName,
      this._tableName,
      this._onCreateString
      );

  Future<Database> init() async {
    String _path = await getDatabasesPath() + _dbName;
    return  await openDatabase(_path, onCreate: onCreate);
  }

  void onCreate(Database _db, int version) async =>
      await _db.execute(_onCreateString);

  Future<List<Map<String, dynamic>>> query(int id) async => await _db.query(_tableName, where: 'id=?',whereArgs: [id]);

  Future<List<Map<String, dynamic>>> queryAll() async => await _db.query(_tableName);

  Future<int> insert(Model model) async {
    try{
      await _db.insert(_tableName, model.toMap());
    }
    catch(DatabaseException){
      print('Попытка добавить неуникальное значение!');
    }
    return 0;
  }


  Future<int> update(Model model) async =>
      await _db.update(_tableName, model.toMap(), where: 'id = ?', whereArgs: [model.id]);

  Future<int> delete(Model model) async =>
      await _db.delete(_tableName, where: 'id = ?', whereArgs: [model.id]);

}