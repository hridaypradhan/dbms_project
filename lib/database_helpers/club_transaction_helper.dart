import 'package:dbms_project/database_helpers/balances_helper.dart';
import 'package:dbms_project/global/constants.dart';
import 'package:dbms_project/database_helpers/database_helper.dart';
import 'package:dbms_project/global/dummy_data.dart';
import 'package:dbms_project/global/enums.dart';
import 'package:dbms_project/models/club_transaction.dart';
import 'package:flutter/material.dart';

class ClubTransactionHelper extends ChangeNotifier {
  ClubTransactionHelper() {
    getTransactionsFromTable();
  }
  DatabaseHelper _databaseHelper = DatabaseHelper();
  List<ClubTransaction> _clubTransactions = [];
  List<CategoryBalance> _categoryBalances = defaultBalanceList;

  void getTransactionsFromTable() async {
    _clubTransactions = [];
    var db = await _databaseHelper.database;
    var result = await db.rawQuery(
        'select * from $clubTransactionsTable order by $clubTransactionsDateTimeColumn desc');
    result.forEach(
      (element) => _clubTransactions.add(
        ClubTransaction.fromMap(element),
      ),
    );
    _updateCategoryBalances();
    notifyListeners();
  }

  void _updateCategoryBalances() async {
    var db = await _databaseHelper.database;
    _categoryBalances = [];
    var result = await db.rawQuery(
      '''select $clubTransactionsPaymentCategoryColumn,
         sum(case when $clubTransactionsTransactionDirectionColumn = "${ClubTransactionDirection.Incoming}" then $clubTransactionsAmountColumn else 0 end) - 
         sum(case when $clubTransactionsTransactionDirectionColumn = "${ClubTransactionDirection.Outgoing}" then $clubTransactionsAmountColumn else 0 end) 
         as $clubTransactionsAmountColumn 
         from $clubTransactionsTable 
         group by $clubTransactionsPaymentCategoryColumn''',
    );
    if (result.isEmpty)
      _categoryBalances = defaultBalanceList;
    else
      result.forEach(
        (element) {
          _categoryBalances.add(
            CategoryBalance(
              paymentCategory: getPaymentCategory(
                element['$clubTransactionsPaymentCategoryColumn'],
              ),
              amount: convertToDouble(
                element['$clubTransactionsAmountColumn'],
              ),
            ),
          );
        },
      );
    if (!_categoryBalances
        .any((element) => element.paymentCategory == PaymentCategory.Food))
      _categoryBalances.add(defaultBalanceList[0]);
    if (!_categoryBalances
        .any((element) => element.paymentCategory == PaymentCategory.Transport))
      _categoryBalances.add(defaultBalanceList[1]);
    if (!_categoryBalances
        .any((element) => element.paymentCategory == PaymentCategory.Misc))
      _categoryBalances.add(defaultBalanceList[2]);
  }

  List<ClubTransaction> get clubTransactions => _clubTransactions;
  List<CategoryBalance> get categoryBalances => _categoryBalances;

  void insertTransaction(ClubTransaction transaction) async {
    var db = await _databaseHelper.database;
    var result = await db.insert(
      '$clubTransactionsTable',
      transaction.toMap(),
    );
    getTransactionsFromTable();
    print('Club Transaction insertion result : $result');
  }

  void deleteTransaction(String id) async {
    var db = await _databaseHelper.database;
    var result = await db.delete(
      '$clubTransactionsTable',
      where: '$clubTransactionsIdColumn = ?',
      whereArgs: [id],
    );
    getTransactionsFromTable();
    print('Deletion result : $result');
  }
}
