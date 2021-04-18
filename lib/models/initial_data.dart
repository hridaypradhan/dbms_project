import 'package:flutter/material.dart';
class InitialData {
    InitialData({
        @required this.clubName,
        @required this.gpay,
        @required this.paytm,
        @required this.cash,
    });

    String clubName;
    double gpay;
    double paytm;
    double cash;

    factory InitialData.fromMap(Map<String, dynamic> json) => InitialData(
        clubName: json["clubName"],
        gpay: json["gpay"].toDouble(),
        paytm: json["paytm"].toDouble(),
        cash: json["cash"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "clubName": clubName,
        "gpay": gpay,
        "paytm": paytm,
        "cash": cash,
    };
}
