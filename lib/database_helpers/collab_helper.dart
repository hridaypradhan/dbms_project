import 'package:dbms_project/database_helpers/database_helper.dart';
import 'package:dbms_project/global/strings.dart';
import 'package:dbms_project/models/club_collab.dart';
import 'package:flutter/material.dart';

class CollabHelper extends ChangeNotifier {
  CollabHelper() {
    getClubCollabsFromTable();
  }
  DatabaseHelper _databaseHelper = DatabaseHelper();

  List<ClubCollab> _clubCollabs = [];

  double _totalAmount = 0;

  double get totalAmount => _totalAmount;

  List<ClubCollab> get clubCollabs => _clubCollabs;

  void insertCollab(ClubCollab collab) async {
    var db = await _databaseHelper.database;
    var result = await db.rawInsert(
      '''
          insert into $clubCollabTable
          (
            $clubCollabClubOneColumn, 
            $clubCollabClubTwoColumn, 
            $clubCollabEventNameColumn, 
            $clubCollabEventMonthColumn, 
            $clubCollabPocOneColumn, 
            $clubCollabPocTwoColumn, 
            $clubCollabImageUrlColumn, 
            $clubCollabResourcesAllocatedColumn,
            $clubCollabIsExpandedColumn
          ) 
          values
          (
            '${collab.clubOne}', 
            '${collab.clubTwo}', 
            '${collab.eventName}', 
            '${collab.eventMonth}', 
            '${collab.pocOne}', 
            '${collab.pocTwo}', 
            '${collab.imageUrl}', 
            '${collab.resourcesAllocated}',
            0
          )
      ''',
    );

    getClubCollabsFromTable();
    print('Collab insertion result : $result');
  }

  void deleteCollab(String eventName) async {
    var db = await _databaseHelper.database;
    var result = await db.rawDelete(
      ''' 
         delete from $clubCollabTable 
         where $clubCollabEventNameColumn = '$eventName'
      ''',
    );
    getClubCollabsFromTable();
    print('Deletion result : $result');
  }

  void getClubCollabsFromTable() async {
    _clubCollabs = [];
    var db = await _databaseHelper.database;
    var result = await db.rawQuery(
      'select * from $clubCollabTable',
    );
    result.forEach(
      (element) => _clubCollabs.add(
        ClubCollab.fromMap(element),
      ),
    );
    notifyListeners();
  }
}
