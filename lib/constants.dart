import 'package:dbms_project/enums.dart';
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

Icon getTransactionIcon(ClubTransactionDirection direction) {
  return direction == ClubTransactionDirection.incoming
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
  switch (category) {
    case PaymentCategory.Food:
      return Icon(
        Icons.food_bank_rounded,
        size: 40.0,
      );
    case PaymentCategory.Transport:
      return Icon(
        Icons.emoji_transportation_rounded,
        size: 40.0,
      );
    default:
      return Icon(
        Icons.attach_money,
        size: 50.0,
      );
  }
}

String getCategoryName(transactionOrBalance) =>
    transactionOrBalance.paymentCategory.toString().substring(
        transactionOrBalance.paymentCategory.toString().indexOf('.') + 1);

PaymentMethod getPaymentMethod(String method) {
  if (method == PaymentMethod.gpay.toString())
    return PaymentMethod.gpay;
  else if (method == PaymentMethod.paytm.toString())
    return PaymentMethod.paytm;
  else
    return PaymentMethod.cash;
}

PaymentCategory getPaymentCategory(String category) {
  if (category == PaymentCategory.Food.toString())
    return PaymentCategory.Food;
  else if (category == PaymentCategory.Transport.toString())
    return PaymentCategory.Transport;
  else
    return PaymentCategory.Misc;
}

ClubTransactionDirection getDirection(String direction) {
  if (direction == ClubTransactionDirection.incoming.toString())
    return ClubTransactionDirection.incoming;
  else
    return ClubTransactionDirection.outgoing;
}
