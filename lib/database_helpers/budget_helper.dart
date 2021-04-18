import 'package:dbms_project/database_helpers/database_helper.dart';
import 'package:dbms_project/global/strings.dart';
import 'package:dbms_project/models/budget_item.dart';
import 'package:flutter/material.dart';

class BudgetHelper extends ChangeNotifier {
  BudgetHelper() {
    getBudgetItemsFromTable();
  }
  DatabaseHelper _databaseHelper = DatabaseHelper();
  List<BudgetItem> _budgetItems = [];
  List<BudgetItem> get budgetItems => _budgetItems;

  void insertBudgetItem(BudgetItem budgetItem) async {
    var db = await _databaseHelper.database;
    var result = await db.insert(
      '$budgetTable',
      budgetItem.toMap(), 
    );

    getBudgetItemsFromTable();
    print('Budget insertion result : $result');
  }

  void deleteBudgetItem(String eventName) async {
    var db = await _databaseHelper.database;
    var result = await db.delete(
      '$budgetTable',
      where: '$budgetEventNameColumn = ?',
      whereArgs: [eventName],
    );
    getBudgetItemsFromTable();
    print('Deletion result : $result');
  }

  void getBudgetItemsFromTable() async {
    _budgetItems = [];
    var db = await _databaseHelper.database;
    var result = await db
        .rawQuery('select * from $budgetTable order by $budgetDateTimeColumn');
    result.forEach(
      (element) => _budgetItems.add(
        BudgetItem.fromMap(element),
      ),
    );
    if (_budgetItems.length == 1)
      _budgetItems.add(
        BudgetItem(
          dateTime: DateTime.now(),
          amount: 0.0,
          eventName: 'Sample Event',
          description: 'Add more events!',
        ),
      );
    notifyListeners();
  }
}
