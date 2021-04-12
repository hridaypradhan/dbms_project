import 'package:dbms_project/constants.dart';
import 'package:dbms_project/database_helpers/database_helper.dart';
import 'package:dbms_project/models/club_transaction.dart';

class ClubTransactionHelper {
  void insertTransaction(ClubTransaction transaction) async {
    var db = await DatabaseHelper().database;
    var result = await db.insert(
      '$clubTransactionsTable',
      transaction.toMap(),
    );
    print('result : $result');
  }

  void deleteTransaction(String id) async {
    var db = await DatabaseHelper().database;
    var result = await db.delete(
      '$clubTransactionsTable',
      where: '$clubTransactionsPayerColumn = ?',
      whereArgs: [id],
    );
    print('result : $result');
  }
}
