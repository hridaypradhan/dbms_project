import '../../database_helpers/club_transaction_helper.dart';
import '../../models/club_transaction.dart';
import 'widgets/category_balance_card.dart';
import 'widgets/recent_club_transaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: Provider.of<ClubTransactionHelper>(context)
                    .categoryBalances
                    .map<Widget>(
                      (CategoryBalance balance) => CategoryBalanceCard(
                        categoryBalance: balance,
                      ),
                    )
                    .toList(),
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
                        .isNotEmpty
                    ? Provider.of<ClubTransactionHelper>(context)
                        .clubTransactions
                        .map<Widget>(
                          (ClubTransaction transaction) =>
                              RecentClubTransaction(
                            clubTransaction: transaction,
                          ),
                        )
                        .toList()
                    : [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'No transactions yet. Press the "Add" button to record transactions!',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
