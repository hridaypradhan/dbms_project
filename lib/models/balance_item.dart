import 'package:flutter/material.dart';

class BalanceItem {
  BalanceItem({
    @required this.gpay,
    @required this.paytm,
    @required this.cash,
    this.income,
    this.expense,
    this.totalBalance,
  });
 
  double gpay, paytm, cash, income, expense, totalBalance;

  factory BalanceItem.fromMap(Map<String, dynamic> json) => BalanceItem(
        gpay: json["gpay"].toDouble(),
        paytm: json["paytm"].toDouble(),
        cash: json["cash"].toDouble(),
        income: json["income"].toDouble(),
        expense: json["expense"].toDouble(),
        totalBalance: json["gpay"].toDouble() +
            json["paytm"].toDouble() +
            json["cash"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "gpay": gpay,
        "paytm": paytm,
        "cash": cash,
        "income": income,
        "expense": expense,
        "totalBalance": totalBalance,
      };
}
