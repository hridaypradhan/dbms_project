import 'package:dbms_project/enums.dart';
import 'package:dbms_project/models/club_transaction.dart';

ClubTransaction dummyTransaction = ClubTransaction(
  payer: 'Hriday',
  payee: 'SNU',
  description: 'AC recharge',
  amount: 1000,
  paymentMethod: PaymentMethod.paytm,
  dateTime: DateTime.now(),
  transactionDirection: ClubTransactionDirection.outgoing,
);

List<ClubTransaction> dummyList = [
  dummyTransaction,
  dummyTransaction,
  dummyTransaction,
  dummyTransaction,
  dummyTransaction,
];
