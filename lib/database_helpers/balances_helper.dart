import 'package:dbms_project/database_helpers/database_helper.dart';
import 'package:dbms_project/global/constants.dart';
import 'package:dbms_project/global/enums.dart';
import 'package:dbms_project/models/balance_item.dart';
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

  void getBalancesFromTable() async {
    var db = await _databaseHelper.database;
    var result = await db.rawQuery(
      '''select $clubTransactionsPaymentMethodColumn, 
         sum(case when $clubTransactionsTransactionDirectionColumn = "${ClubTransactionDirection.Incoming}" then $clubTransactionsAmountColumn else 0 end) - 
         sum(case when $clubTransactionsTransactionDirectionColumn = "${ClubTransactionDirection.Outgoing}" then $clubTransactionsAmountColumn else 0 end) 
         as $clubTransactionsAmountColumn 
         from $clubTransactionsTable 
         group by $clubTransactionsPaymentMethodColumn''',
    );
    double gpay = 0, paytm = 0, cash = 0;
    result.forEach(
      (element) {
        print('Jere');
        if (element.containsValue(PaymentMethod.GPay.toString()))
          gpay = convertToDouble(element[clubTransactionsAmountColumn]);
        else if (element.containsValue(PaymentMethod.Paytm.toString()))
          paytm = convertToDouble(element[clubTransactionsAmountColumn]);
        else if (element.containsValue(PaymentMethod.Cash.toString()))
          cash = convertToDouble(element[clubTransactionsAmountColumn]);
      },
    );
    _balances.gpay = gpay;
    _balances.paytm = paytm;
    _balances.cash = cash;
    _balances.totalBalance = gpay + paytm + cash;
    // TODO Income/Expense query

    notifyListeners();
  }
}
