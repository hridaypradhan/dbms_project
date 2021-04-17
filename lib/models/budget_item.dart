import 'package:flutter/material.dart';

class BudgetItem {
  BudgetItem({
    this.id,
    @required this.eventName,
    @required this.amount,
    @required this.dateTime,
    this.description,
  });
  int id;
  String eventName;
  double amount;
  DateTime dateTime;
  String description;

  factory BudgetItem.fromMap(Map<String, dynamic> json) => BudgetItem(
        id: json["id"],
        eventName: json["eventName"],
        amount: json["amount"].toDouble(),
        dateTime: DateTime.parse(json["dateTime"]),
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "eventName": eventName,
        "amount": amount,
        "dateTime": dateTime.toIso8601String(),
        "description": description,
      };
}
