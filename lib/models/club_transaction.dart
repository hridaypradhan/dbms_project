import 'package:dbms_project/global/constants.dart';
import 'package:dbms_project/global/enums.dart';
import 'package:dbms_project/global/strings.dart';
import 'package:flutter/material.dart';

class ClubTransaction {
  int id;
  String payer, payee, description;
  double amount;
  PaymentMethod paymentMethod;
  DateTime dateTime;
  PaymentCategory paymentCategory;
  ClubTransactionDirection transactionDirection;

  ClubTransaction({
    this.id,
    @required this.payer,
    @required this.payee,
    this.description,
    @required this.amount,
    this.paymentMethod,
    this.dateTime,
    this.paymentCategory,
    @required this.transactionDirection,
  });

  factory ClubTransaction.fromMap(Map<String, dynamic> json) => ClubTransaction(
        id: json[clubTransactionsIdColumn],
        payer: json[clubTransactionsPayerColumn],
        payee: json[clubTransactionsPayeeColumn],
        description: json[clubTransactionsDescriptionColumn],
        amount: json[clubTransactionsAmountColumn].toDouble(),
        paymentMethod:
            getPaymentMethod(json[clubTransactionsPaymentMethodColumn]),
        dateTime: DateTime.parse(json[clubTransactionsDateTimeColumn]),
        paymentCategory:
            getPaymentCategory(json[clubTransactionsPaymentCategoryColumn]),
        transactionDirection:
            getDirection(json[clubTransactionsTransactionDirectionColumn]),
      );

  Map<String, dynamic> toMap() => {
        clubTransactionsIdColumn: id,
        clubTransactionsPayerColumn: payer,
        clubTransactionsPayeeColumn: payee,
        clubTransactionsDescriptionColumn: description,
        clubTransactionsAmountColumn: amount,
        clubTransactionsPaymentMethodColumn: paymentMethod.toString(),
        clubTransactionsDateTimeColumn: dateTime.toIso8601String(),
        clubTransactionsPaymentCategoryColumn: paymentCategory.toString(),
        clubTransactionsTransactionDirectionColumn:
            transactionDirection.toString(),
      };
}

class CategoryBalance {
  CategoryBalance({
    this.paymentCategory,
    this.amount,
  });

  PaymentCategory paymentCategory;
  double amount;

  factory CategoryBalance.fromMap(Map<String, dynamic> json) {
    print(CategoryBalance.fromMap(json).toMap());
    return CategoryBalance(
      paymentCategory:
          getPaymentCategory(json[clubTransactionsPaymentCategoryColumn]),
      amount: json["amount"].toDouble(),
    );
  }

  Map<String, dynamic> toMap() => {
        "paymentCategory": paymentCategory,
        "amount": amount,
      };
}
