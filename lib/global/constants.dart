import 'package:dbms_project/global/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final String clubTransactionsTable = 'clubTransactionsTable';
final String clubTransactionsPayerColumn = 'payer';
final String clubTransactionsPayeeColumn = 'payee';
final String clubTransactionsDescriptionColumn = 'description';
final String clubTransactionsPaymentMethodColumn = 'paymentMethod';
final String clubTransactionsTransactionDirectionColumn =
    'transactionDirection';
final String clubTransactionsDateTimeColumn = 'dateTime';
final String clubTransactionsAmountColumn = 'amount';
final String clubTransactionsPaymentCategoryColumn = 'paymentCategory';
final String clubTransactionsIdColumn = 'id';

final String clubCollabsTable = 'clubCollabsTable';

final String budgetTable = 'budgetTable';
final String budgetEventNameColumn = 'eventName';
final String budgetAmountColumn = 'amount';
final String budgetDateTimeColumn = 'dateTime';
final String budgetDescriptionColumn = 'description';

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

  double convertToDouble(int n) => n.toDouble();

