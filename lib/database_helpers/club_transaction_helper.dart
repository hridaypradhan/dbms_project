import 'package:dbms_project/constants.dart';
import 'package:dbms_project/database_helpers/database_helper.dart';
import 'package:dbms_project/models/club_transaction.dart';
import 'package:flutter/cupertino.dart';

class ClubTransactionHelper extends ChangeNotifier {
  ClubTransactionHelper() {
    getTransactionsFromTable();
  }
  DatabaseHelper _databaseHelper = DatabaseHelper();
  List<ClubTransaction> _clubTransactions = [];

  void getTransactionsFromTable() async {
    _clubTransactions = [];
    var db = await _databaseHelper.database;
    var result = await db.rawQuery('select * from $clubTransactionsTable order by id desc');
    result.forEach(
      (element) => _clubTransactions.add(
        ClubTransaction.fromMap(element),
      ),
    );
    notifyListeners();
  }

  get clubTransactions => _clubTransactions;

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
    var db = await DatabaseHelper().database;
    var result = await db.delete(
      '$clubTransactionsTable',
      where: '$clubTransactionsIdColumn = ?',
      whereArgs: [id],
    );
    getTransactionsFromTable();
    print('Deletion result : $result');
  }
}
