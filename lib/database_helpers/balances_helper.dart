import 'package:dbms_project/database_helpers/database_helper.dart';
import 'package:dbms_project/global/constants.dart';
import 'package:dbms_project/global/enums.dart';
import 'package:dbms_project/global/strings.dart';
import 'package:dbms_project/models/balance_item.dart';
import 'package:dbms_project/models/initial_data.dart';
import 'package:flutter/material.dart';

class BalancesHelper extends ChangeNotifier {
  BalancesHelper() {
    getBalancesFromTable();
  }
  DatabaseHelper _databaseHelper = DatabaseHelper();
  BalanceItem _balances = BalanceItem(
    gpay: 0,
    paytm: 0,
    cash: 0,
    income: 0,
    expense: 0,
    totalBalance: 0,
  );
  BalanceItem get balances => _balances;

  void initializeBalances(InitialData initialData) {
    _balances = BalanceItem(
      gpay: initialData.gpay,
      paytm: initialData.paytm,
      cash: initialData.cash,
      income: 0,
      expense: 0,
      totalBalance: initialData.cash + initialData.paytm + initialData.gpay,
    );
    notifyListeners();
  }

  void getBalancesFromTable() async {
    var db = await _databaseHelper.database;
    var result = await db.rawQuery('select * from $initialDataTable');
    InitialData _initialData = InitialData.fromMap(result[0]);
    initializeBalances(_initialData);
    result = await db.rawQuery(
      '''select $clubTransactionsPaymentMethodColumn, 
         sum(case when $clubTransactionsTransactionDirectionColumn = '${ClubTransactionDirection.Incoming}' then $clubTransactionsAmountColumn else 0 end) - 
         sum(case when $clubTransactionsTransactionDirectionColumn = '${ClubTransactionDirection.Outgoing}' then $clubTransactionsAmountColumn else 0 end) 
         as $clubTransactionsAmountColumn 
         from $clubTransactionsTable 
         group by $clubTransactionsPaymentMethodColumn''',
    );
    double gpay = 0, paytm = 0, cash = 0;
    result.forEach(
      (element) {
        if (element.containsValue(PaymentMethod.GPay.toString()))
          gpay = convertToDouble(element[clubTransactionsAmountColumn]);
        else if (element.containsValue(PaymentMethod.Paytm.toString()))
          paytm = convertToDouble(element[clubTransactionsAmountColumn]);
        else if (element.containsValue(PaymentMethod.Cash.toString()))
          cash = convertToDouble(element[clubTransactionsAmountColumn]);
      },
    );
    _balances.gpay += gpay;
    _balances.paytm += paytm;
    _balances.cash += cash;
    _balances.totalBalance += gpay + paytm + cash;
    result = await db.rawQuery(
      '''
         select ifnull (
           ( 
             select sum ( 
               case when $clubTransactionsTransactionDirectionColumn = '${ClubTransactionDirection.Incoming}' 
               then $clubTransactionsAmountColumn else 0 end 
           ) 
           from $clubTransactionsTable 
        ), 0 ) as $balancesIncomeColumn
      ''',
    );
    _balances.income += convertToDouble(result[0][balancesIncomeColumn]);
    result = await db.rawQuery(
      '''
         select ifnull (
           ( 
             select sum ( 
               case when $clubTransactionsTransactionDirectionColumn = '${ClubTransactionDirection.Outgoing}' 
               then $clubTransactionsAmountColumn else 0 end 
           ) 
           from $clubTransactionsTable 
        ), 0 ) as $balancesExpenseColumn
      ''',
    );
    _balances.expense += convertToDouble(result[0][balancesExpenseColumn]);

    notifyListeners();
  }
}
