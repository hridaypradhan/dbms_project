import 'package:dbms_project/database_helpers/database_helper.dart';
import 'package:dbms_project/models/transaction.dart';

class TransactionHelper {
   void insertAlarm(Transaction transaction) async {
    var db = await DatabaseHelper().database;
    // TODO fix
    // var result = await db.insert(transactionsTable, transaction.toMap());
    // print('result : $result');
  }
}
