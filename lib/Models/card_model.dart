import 'dart:convert';
import 'package:fincontrol/Models/model.dart';


class DiscountCard implements Model {

  static String table = 'todo_items';

  int id;
  String sideOneName;
  String sideOneAdditionalInfo;
  String sideTwoData;
  String sideTwoAdditionalInfo;

  DiscountCard({ required this.id, required this.sideOneName, required this.sideOneAdditionalInfo, required this.sideTwoData, required this.sideTwoAdditionalInfo });

  @override
  Map<String, dynamic> toMap() {

    Map<String, dynamic> map = {
      'id': id,
      'sideOneName': sideOneName,
      'sideOneAdditionalInfo': sideOneAdditionalInfo,
      'sideTwoData': sideTwoData,
      'sideTwoAdditionalInfo': sideTwoAdditionalInfo
    };

    return map;
  }

  static DiscountCard fromMap(Map<String, dynamic> map) {

    return DiscountCard(
        id: map['id'],
        sideOneName: map['sideOneName'],
        sideOneAdditionalInfo: map['sideOneAdditionalInfo'],
        sideTwoData: map['sideTwoData'],
        sideTwoAdditionalInfo: map['sideTwoAdditionalInfo']
    );
  }


}