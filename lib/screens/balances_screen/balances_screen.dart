import '../../database_helpers/balances_helper.dart';
import 'widgets/balance_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BalancesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var _balances = Provider.of<BalancesHelper>(context).balances;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: screenSize.width * 0.8,
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: FittedBox(
                  child: Text(
                    'Total Balance: ₹${_balances.totalBalance}',
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: screenSize.width * 0.3,
                      margin: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.09,
                        vertical: screenSize.width * 0.02,
                      ),
                      padding: EdgeInsets.all(screenSize.width * 0.04),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Text(
                        'Credit \n₹${_balances.income}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Container(
                      width: screenSize.width * 0.3,
                      margin: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.09,
                        vertical: screenSize.width * 0.02,
                      ),
                      padding: EdgeInsets.all(screenSize.width * 0.04),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Text(
                        'Debit \n₹${_balances.expense}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      BalanceCard(
                        amount: _balances.gpay,
                        paymentMethod: 'gpay',
                      ),
                      BalanceCard(
                        amount: _balances.paytm,
                        paymentMethod: 'paytm',
                      ),
                      BalanceCard(
                        amount: _balances.cash,
                        paymentMethod: 'cash',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
