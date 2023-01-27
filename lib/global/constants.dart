import 'enums.dart';
import '../models/club_transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Icon getTransactionIcon(ClubTransactionDirection direction) {
  return direction == ClubTransactionDirection.Incoming
      ? Icon(
          Icons.arrow_downward_rounded,
          color: Colors.green,
        )
      : Icon(
          Icons.arrow_upward_rounded,
          color: Colors.red,
        );
}

Icon getPaymentCategoryIcon(PaymentCategory category) {
  if (category == PaymentCategory.Transport)
    return Icon(
      Icons.emoji_transportation_rounded,
      size: 40.0,
    );
  else if (category == PaymentCategory.Food)
    return Icon(
      Icons.food_bank_rounded,
      size: 40.0,
    );
  else
    return Icon(
      CupertinoIcons.money_dollar,
      size: 40.0,
    );
}

String getCategoryName(transactionOrBalance) =>
    transactionOrBalance.paymentCategory.toString().substring(
        transactionOrBalance.paymentCategory.toString().indexOf('.') + 1);

String getPaymentMethodName(ClubTransaction transaction) =>
    transaction.paymentMethod
        .toString()
        .substring(transaction.paymentMethod.toString().indexOf('.') + 1);

PaymentMethod getPaymentMethod(String method) {
  if ('PaymentMethod.$method' == PaymentMethod.GPay.toString() ||
      method == PaymentMethod.GPay.toString())
    return PaymentMethod.GPay;
  else if ('PaymentMethod.$method' == PaymentMethod.Paytm.toString() ||
      method == PaymentMethod.Paytm.toString())
    return PaymentMethod.Paytm;
  else
    return PaymentMethod.Cash;
}

PaymentCategory getPaymentCategory(String category) {
  if ('PaymentCategory.$category' == PaymentCategory.Food.toString() ||
      category == PaymentCategory.Food.toString())
    return PaymentCategory.Food;
  else if ('PaymentCategory.$category' ==
          PaymentCategory.Transport.toString() ||
      category == PaymentCategory.Transport.toString())
    return PaymentCategory.Transport;
  else
    return PaymentCategory.Misc;
}

ClubTransactionDirection getDirection(String direction) {
  if ('ClubTransactionDirection.$direction' ==
          ClubTransactionDirection.Incoming.toString() ||
      direction == ClubTransactionDirection.Incoming.toString()) {
    return ClubTransactionDirection.Incoming;
  } else
    return ClubTransactionDirection.Outgoing;
}

double convertToDouble(n) => n is int ? n.toDouble() : n;

CategoryBalance foodBalance = CategoryBalance(
  paymentCategory: PaymentCategory.Food,
  amount: 0,
);
CategoryBalance transportBalance = CategoryBalance(
  paymentCategory: PaymentCategory.Transport,
  amount: 0,
);
CategoryBalance miscBalance = CategoryBalance(
  paymentCategory: PaymentCategory.Misc,
  amount: 0,
);

List<CategoryBalance> defaultBalanceList = [
  foodBalance,
  transportBalance,
  miscBalance,
];
