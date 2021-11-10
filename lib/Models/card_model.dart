import 'dart:convert';
import 'package:fincontrol/Models/model.dart';


class Cards extends Model {

  static String table = 'todo_items';

  int id;
  String content;
  String additionalInfo;

  Cards({ required this.id, required this.content, required this.additionalInfo });

  Map<String, dynamic> toMap() {

    Map<String, dynamic> map = {
      'id': id,
      'content': content,
      'additionalInfo': additionalInfo
    };

    return map;
  }

  static Cards fromMap(Map<String, dynamic> map) {

    return Cards(
        id: map['id'],
        content: map['content'],
        additionalInfo: map['additionalInfo']
    );
  }
}