import 'package:dbms_project/constants.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database _database;
  static DatabaseHelper _databaseHelper;
  DatabaseHelper._createInstance();
  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + 'finance.db';

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
              create table $clubTransactionsTable (
                $clubTransactionsIdColumn integer primary key autoincrement,
                $clubTransactionsPayerColumn text,
                $clubTransactionsPayeeColumn text,
                $clubTransactionsDescriptionColumn text,
                $clubTransactionsAmountColumn decimal,
                $clubTransactionsPaymentMethodColumn text,
                $clubTransactionsDateTimeColumn text,
                $clubTransactionsPaymentCategoryColumn text,
                $clubTransactionsTransactionDirectionColumn text
              )
        ''');
      },
    );
    return database;
  }

  void showClubTransactionTable() async {
    var db = await database;
    List list = await db.rawQuery('select * from $clubTransactionsTable order by id desc');
    print(list);
  }
}
