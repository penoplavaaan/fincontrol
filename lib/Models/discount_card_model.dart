import 'model.dart';

class DiscountCard extends Model{

  static String table = 'discount_card';

  int id;
  String name;
  String content;
  String additionalInfo;

  DiscountCard({
    required this.id,
    required this.name,
    required this.content,
    required this.additionalInfo
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'name': name,
      'content': content,
      'additionalInfo': additionalInfo
    };

    return map;
  }

  static DiscountCard fromMap(Map<String, dynamic> map) {

    return DiscountCard(
        id: map['id'],
        name: map['name'],
        content: map['content'],
        additionalInfo: map['additionalInfo']
    );
  }
}