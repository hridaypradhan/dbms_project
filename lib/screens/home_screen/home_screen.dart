import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:dbms_project/database_helpers/club_transaction_helper.dart';
import 'package:dbms_project/database_helpers/database_helper.dart';
import 'package:dbms_project/dummy_data.dart';
import 'package:dbms_project/screens/home_screen/widgets/recent_club_transaction.dart';
import 'package:flutter/cupertino.dart';
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
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: screenSize.height / 2,
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: SizedBox(
                child: ListView.builder(
                  padding: EdgeInsets.all(5.0),
                  itemCount: dummyList.length,
                  itemBuilder: (context, index) => RecentClubTransaction(
                    clubTransaction: dummyList[index],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*
Row(
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
*/