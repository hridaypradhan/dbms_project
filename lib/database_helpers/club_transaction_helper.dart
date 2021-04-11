import 'package:dbms_project/database_helpers/database_helper.dart';
import 'package:dbms_project/models/club_transaction.dart';
import 'package:sqflite_common/sqlite_api.dart';

class TransactionHelper  {
   void insertAlarm(ClubTransaction transaction) async {
    var db = await DatabaseHelper().database;
    // TODO fix
    // var result = await db.insert(transactionsTable, transaction.toMap());
    // print('result : $result');
  }

  
}
