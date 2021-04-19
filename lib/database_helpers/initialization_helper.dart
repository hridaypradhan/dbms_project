import 'package:dbms_project/database_helpers/database_helper.dart';
import 'package:dbms_project/global/strings.dart';
import 'package:dbms_project/models/initial_data.dart';
import 'package:flutter/material.dart';

class InitializationHelper extends ChangeNotifier {
  InitializationHelper() {
    checkInitialization();
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
    notifyListeners();
  }

  Future<InitialData> getInitialDataFromTable() async {
    var db = await _databaseHelper.database;
    var result = await db.rawQuery('select * from $initialDataTable');
    _initialData = InitialData.fromMap(result[0]);
    return _initialData;
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
