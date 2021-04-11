import 'package:dbms_project/enums.dart';

class Transaction {
  String payer, payee, description;
  double amount;
  PaymentMethod paymentMethod;
  DateTime dateTime;
  TransactionDirection transactionDirection;
  // TODO screenshot upload

  Transaction({
    this.payer,
    this.payee,
    this.description,
    this.amount,
    this.paymentMethod,
    this.dateTime,
    this.transactionDirection
  });
}
