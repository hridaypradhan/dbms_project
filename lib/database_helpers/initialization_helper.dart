import 'database_helper.dart';
import '../global/strings.dart';
import '../models/initial_data.dart';
import 'package:flutter/material.dart';

class InitializationHelper extends ChangeNotifier {
  InitializationHelper() {
    getInitialDataFromTable();
  }
  bool _dataInitialized = false;
  InitialData _initialData;
  DatabaseHelper _databaseHelper = DatabaseHelper();
  bool get dataInitialized => _dataInitialized;
  InitialData get initialData => _initialData;

  void checkInitialization() async {
    var db = await _databaseHelper.database;
    var result = await db.rawQuery('select * from $initialDataTable');
    _dataInitialized = result.length > 0;
  }

  void getInitialDataFromTable() async {
    var db = await _databaseHelper.database;
    var result = await db.rawQuery('select * from $initialDataTable');
    if (result.isNotEmpty) {
      _initialData = InitialData.fromMap(result[0]);
      _dataInitialized = true;
    }
    notifyListeners();
  }

  void insertInitialData(InitialData initialData) async {
    var db = await _databaseHelper.database;
    var result = await db.rawInsert(
      '''insert into $initialDataTable 
      (
        $initialDataClubNameColumn, 
        $initialDataGpayColumn, 
        $initialDataPaytmColumn, 
        $initialDataCashColumn
      ) 
      values 
      (
        '${initialData.clubName}', 
        '${initialData.gpay}', 
        '${initialData.paytm}', 
        '${initialData.cash}'
      )''',
    );
    if (result > 0) _dataInitialized = true;
    getInitialDataFromTable();
    print('Initialisation insertion result: $result');
  }
}
