import 'package:dbms_project/constants.dart';
import 'package:dbms_project/database_helpers/database_helper.dart';
import 'package:dbms_project/dummy_data.dart';
import 'package:dbms_project/models/club_transaction.dart';
import 'package:flutter/cupertino.dart';

class ClubTransactionHelper extends ChangeNotifier {
  ClubTransactionHelper() {
    getTransactionsFromTable();
  }
  DatabaseHelper _databaseHelper = DatabaseHelper();
  List<ClubTransaction> _clubTransactions = [];
  List<CategoryBalance> _categoryBalances = dummyCategoryBalanceList;

  void getTransactionsFromTable() async {
    _clubTransactions = [];
    var db = await _databaseHelper.database;
    var result = await db
        .rawQuery('select * from $clubTransactionsTable order by id desc');
    result.forEach(
      (element) => _clubTransactions.add(
        ClubTransaction.fromMap(element),
      ),
    );
    notifyListeners();
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
    print('Insertion result : $result');
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
