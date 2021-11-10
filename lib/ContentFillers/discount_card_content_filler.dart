import 'package:fincontrol/Models/card_model.dart';
import 'package:fincontrol/Services/db.dart';
import 'package:sqflite/sqflite.dart';

class DiscountCardContentFiller {
  static const String dbName = 'fincontrol';
  static const String tableName = 'discountCards';
  static const String onCreateString =
      'CREATE TABLE IF NOT EXISTS $tableName (id INTEGER PRIMARY KEY NOT NULL, sideOneName STRING, sideOneAdditionalInfo STRING, sideTwoData STRING, sideTwoAdditionalInfo STRING)';

  static final discountCards = [
    DiscountCard(
        id: 1,
        sideOneName: 'Лента',
        sideOneAdditionalInfo: 'Карта №1',
        sideTwoData: 'https://livebook72.ru/test',
        sideTwoAdditionalInfo: 'Количество баллов: 18'
    ),
    DiscountCard(
        id: 2,
        sideOneName: 'Ашан',
        sideOneAdditionalInfo: 'Карта №2',
        sideTwoData: 'https://livebook72.ru/',
        sideTwoAdditionalInfo: 'Количество баллов: 29'
    )
  ];


}
