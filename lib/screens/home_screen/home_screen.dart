import 'package:dbms_project/database_helpers/club_transaction_helper.dart';
import 'package:dbms_project/database_helpers/database_helper.dart';
import 'package:dbms_project/dummy_data.dart';
import 'package:dbms_project/models/club_transaction.dart';
import 'package:dbms_project/screens/home_screen/widgets/category_balance_card.dart';
import 'package:dbms_project/screens/home_screen/widgets/recent_club_transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenSize.height / 3.5,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dummyCategoryBalanceList.length,
                itemBuilder: (context, index) => CategoryBalanceCard(
                  categoryBalance: dummyCategoryBalanceList[index],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 20.0),
              child: Text(
                'Recent Transactions',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: Provider.of<ClubTransactionHelper>(context)
                    .clubTransactions
                    .map<Widget>(
                      (transaction) => RecentClubTransaction(
                        clubTransaction: transaction,
                      ),
                    )
                    .toList(),
              ),
            ),
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