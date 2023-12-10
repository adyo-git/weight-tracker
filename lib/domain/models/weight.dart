import 'package:cloud_firestore/cloud_firestore.dart';

class Weight {
  late String id;
  late double weight;
  late DateTime date;

  Weight({required this.id, required this.weight, required this.date});

  Weight.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    weight = json['weight'] as double;
    date = dateTimeFromTimeStamp(json["date"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'weight': weight,
      'date': date,
    };
  }

  DateTime dateTimeFromTimeStamp(Timestamp time) => time.toDate();
}
