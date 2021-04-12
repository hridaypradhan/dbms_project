import 'package:dbms_project/enums.dart';
import 'package:dbms_project/models/balance_item.dart';
import 'package:dbms_project/models/club_transaction.dart';

ClubTransaction dummyTransaction = ClubTransaction(
  payer: 'Hriday',
  payee: 'SNU',
  description: 'AC recharge',
  amount: 1000,
  paymentMethod: PaymentMethod.paytm,
  dateTime: DateTime.now(),
  paymentCategory: PaymentCategory.Misc,
  transactionDirection: ClubTransactionDirection.outgoing,
);

List<ClubTransaction> dummyList = [
  dummyTransaction,
  dummyTransaction,
  dummyTransaction,
  dummyTransaction,
  dummyTransaction,
  dummyTransaction,
];

CategoryBalance dummyCategoryBalance = CategoryBalance(
  paymentCategory: PaymentCategory.Food,
  amount: 1500.0,
);

List<CategoryBalance> dummyCategoryBalanceList = [
  dummyCategoryBalance,
  dummyCategoryBalance,
  dummyCategoryBalance,
];

BalanceItem dummyBalanceItem = BalanceItem(
  gpay: 10,
  paytm: 10,
  cash: 10,
  income: 40,
  expense: 50,
  totalBalance: 30,
);

List<BalanceItem> dummyBalanceItemList = [
  dummyBalanceItem,
  dummyBalanceItem,
  dummyBalanceItem,
];
