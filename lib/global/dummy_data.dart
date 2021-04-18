import 'package:dbms_project/global/strings.dart';
import 'package:dbms_project/global/enums.dart';
import 'package:dbms_project/models/balance_item.dart';
import 'package:dbms_project/models/budget_item.dart';
import 'package:dbms_project/models/club_collab.dart';
import 'package:dbms_project/models/club_transaction.dart';

ClubTransaction dummyTransaction = ClubTransaction(
  payer: 'Hriday',
  payee: 'SNU',
  description: 'AC recharge',
  amount: 1000,
  paymentMethod: PaymentMethod.Paytm,
  dateTime: DateTime.now(),
  paymentCategory: PaymentCategory.Misc,
  transactionDirection: ClubTransactionDirection.Outgoing,
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

ClubCollab dummyCollab = ClubCollab(
  clubOne: 'TEDx',
  clubTwo: 'Aura',
  eventMonth: 'September',
  eventName: 'Qissa',
  resourcesAllocated: 2000.0,
  pocOne: 'Hriday',
  pocTwo: 'Shraddha',
  imageUrl: tedxImageUrl,
  isExpanded: false,
);
ClubCollab dummyCollab2 = ClubCollab(
  clubOne: 'Inspiria',
  clubTwo: 'E-Cell',
  eventMonth: 'January',
  eventName: 'E-Summit',
  resourcesAllocated: 4000.0,
  pocOne: 'Hriday',
  pocTwo: 'Shraddha',
  imageUrl: inspiriaImageUrl,
  isExpanded: false,
);
ClubCollab dummyCollab3 = ClubCollab(
  clubOne: 'Inspiria',
  clubTwo: 'E-Cell',
  eventMonth: 'January',
  eventName: 'E-Summit',
  resourcesAllocated: 4000.0,
  pocOne: 'Hriday',
  pocTwo: 'Shraddha',
  imageUrl: ecellImageUrl,
  isExpanded: false,
);
ClubCollab dummyCollab4 = ClubCollab(
  clubOne: 'Inspiria',
  clubTwo: 'E-Cell',
  eventMonth: 'January',
  eventName: 'E-Summit',
  resourcesAllocated: 4000.0,
  pocOne: 'Hriday',
  pocTwo: 'Shraddha',
  imageUrl: auraImageUrl,
  isExpanded: false,
);
ClubCollab dummyCollab5 = ClubCollab(
  clubOne: 'Inspiria',
  clubTwo: 'E-Cell',
  eventMonth: 'January',
  eventName: 'E-Summit',
  resourcesAllocated: 4000.0,
  pocOne: 'Hriday',
  pocTwo: 'Shraddha',
  imageUrl: feedingIndiaSnuImageUrl,
  isExpanded: false,
);

List<ClubCollab> dummyCollabList = [
  dummyCollab,
  dummyCollab2,
  dummyCollab3,
  dummyCollab4,
  dummyCollab5,
];

BudgetItem dummyBudgetItem = BudgetItem(
  eventName: 'Qissa',
  amount: 200.0,
  dateTime: DateTime.now(),
  description: 'Wow event',
);
BudgetItem dummyBudgetItem2 = BudgetItem(
  eventName: 'Conference',
  amount: 2000.0,
  dateTime: DateTime.now(),
  description: 'Wower event',
);

List<BudgetItem> dummyBudgetItemList = [
  dummyBudgetItem,
  dummyBudgetItem2,
];
