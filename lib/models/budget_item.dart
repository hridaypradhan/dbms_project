import 'package:flutter/material.dart';

class BudgetItem { 
  BudgetItem({
    @required this.eventName,
    @required this.amount,
    @required this.dateTime,
    this.description,
  });
  String eventName;
  double amount;
  DateTime dateTime;
  String description;

  factory BudgetItem.fromMap(Map<String, dynamic> json) => BudgetItem(
        eventName: json["eventName"],
        amount: json["amount"].toDouble(),
        dateTime: DateTime.parse(json["dateTime"]),
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "eventName": eventName,
        "amount": amount,
        "dateTime": dateTime.toIso8601String(),
        "description": description,
      };
}
