import '../global/strings.dart';
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
        // Create Club Transactions Table
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
        ''').then(
          (value) => print('Club Transactions Table created!'),
        );
        // Create Budget Table
        await db.execute('''
              create table $budgetTable (
                $budgetEventNameColumn text,
                $budgetAmountColumn decimal,
                $budgetDateTimeColumn text,
                $budgetDescriptionColumn text
              )
        ''').then(
          (value) => print('Budget Table created!'),
        );
        // Create Club Collab Table
        await db.execute('''
              create table $clubCollabTable (
                $clubCollabClubOneColumn text,
                $clubCollabClubTwoColumn text,
                $clubCollabEventNameColumn text,
                $clubCollabEventMonthColumn text,
                $clubCollabPocOneColumn text,
                $clubCollabPocTwoColumn text,
                $clubCollabImageUrlColumn text,
                $clubCollabResourcesAllocatedColumn decimal,
                $clubCollabIsExpandedColumn int
              )
        ''').then(
          (value) => print('Collabs Table created!'),
        );
        // Create Initial Data Table
        await db.execute('''
              create table $initialDataTable (
                $initialDataGpayColumn decimal,
                $initialDataPaytmColumn decimal,
                $initialDataCashColumn decimal,
                $initialDataClubNameColumn text
              )
        ''').then(
          (value) => print('Initial Data Table created!'),
        );
      },
    );
    return database;
  }
}
