import 'package:dbms_project/database_helpers/club_transaction_helper.dart';
import 'package:dbms_project/database_helpers/database_helper.dart';
import 'package:dbms_project/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class HomeScreen extends StatefulWidget {
  static final id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ClubTransactionHelper _clubTransactionHelper = ClubTransactionHelper();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              child: Text('Insert'),
              onPressed: () {
                _clubTransactionHelper.insertTransaction(dummyTransaction);
              },
            ),
            TextButton(
              onPressed: () {
                _clubTransactionHelper.deleteTransaction('Hriday');
              },
              child: Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                DatabaseHelper().showTables();
              },
              child: Text('Show'),
            ),
          ],
        ),
      ),
    );
  }
}
