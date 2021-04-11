import 'package:dbms_project/enums.dart';

class ClubTransaction {
  String payer, payee, description;
  double amount;
  PaymentMethod paymentMethod;
  DateTime dateTime;
  ClubTransactionDirection transactionDirection;
  // TODO screenshot upload

  ClubTransaction({
    this.payer,
    this.payee,
    this.description,
    this.amount,
    this.paymentMethod,
    this.dateTime,
    this.transactionDirection
  });
}
