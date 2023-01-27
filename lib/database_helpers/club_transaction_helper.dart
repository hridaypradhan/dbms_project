import '../global/constants.dart';
import 'database_helper.dart';
import '../global/enums.dart';
import '../global/strings.dart';
import '../models/club_transaction.dart';
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
         sum(case when $clubTransactionsTransactionDirectionColumn = '${ClubTransactionDirection.Incoming}' then $clubTransactionsAmountColumn else 0 end) - 
         sum(case when $clubTransactionsTransactionDirectionColumn = '${ClubTransactionDirection.Outgoing}' then $clubTransactionsAmountColumn else 0 end) 
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
    if (!_categoryBalances.any(
      (element) => element.paymentCategory == PaymentCategory.Food,
    )) _categoryBalances.add(defaultBalanceList[0]);
    if (!_categoryBalances.any(
      (element) => element.paymentCategory == PaymentCategory.Transport,
    )) _categoryBalances.add(defaultBalanceList[1]);
    if (!_categoryBalances.any(
      (element) => element.paymentCategory == PaymentCategory.Misc,
    )) _categoryBalances.add(defaultBalanceList[2]);
  }

  List<ClubTransaction> get clubTransactions => _clubTransactions;
  List<CategoryBalance> get categoryBalances => _categoryBalances;

  void insertTransaction(ClubTransaction transaction) async {
    var db = await _databaseHelper.database;
    var result = await db.rawInsert(
      '''insert into $clubTransactionsTable 
         (
           $clubTransactionsDescriptionColumn, 
           $clubTransactionsPayerColumn, 
           $clubTransactionsPayeeColumn, 
           $clubTransactionsPaymentMethodColumn, 
           $clubTransactionsAmountColumn, 
           $clubTransactionsDateTimeColumn, 
           $clubTransactionsPaymentCategoryColumn, 
           $clubTransactionsTransactionDirectionColumn
         ) 
         values 
         ( 
           '${transaction.description}', 
           '${transaction.payer}', 
           '${transaction.payee}', 
           '${transaction.paymentMethod}', 
           ${transaction.amount}, 
           '${transaction.dateTime.toIso8601String()}', 
           '${transaction.paymentCategory}', 
           '${transaction.transactionDirection}'
         )''',
    );
    getTransactionsFromTable();
    print('Club Transaction insertion result : $result');
  }

  void deleteTransaction(String id) async {
    var db = await _databaseHelper.database;
    var result = await db.rawDelete(
      '''
         delete from $clubTransactionsTable 
         where $clubTransactionsIdColumn = '$id'
      ''',
    );
    getTransactionsFromTable();
    print('Deletion result : $result');
  }
}
