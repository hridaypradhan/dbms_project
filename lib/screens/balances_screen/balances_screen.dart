import 'package:dbms_project/dummy_data.dart';
import 'package:dbms_project/screens/balances_screen/widgets/balance_card.dart';
import 'package:flutter/material.dart';

class BalancesScreen extends StatefulWidget {
  static final id = 'balances_screen';
  @override
  _BalancesScreenState createState() => _BalancesScreenState();
}

class _BalancesScreenState extends State<BalancesScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

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
                    'Total Balance: ₹${dummyBalanceItem.totalBalance}',
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
              Row(
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
                    child: FittedBox(
                      child: Text(
                        'Income \n₹${dummyBalanceItem.income}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
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
                    child: FittedBox(
                      child: Text(
                        'Expense \n₹${dummyBalanceItem.expense}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      BalanceCard(
                        amount: dummyBalanceItem.gpay,
                        paymentMethod: 'gpay',
                      ),
                      BalanceCard(
                        amount: dummyBalanceItem.paytm,
                        paymentMethod: 'paytm',
                      ),
                      BalanceCard(
                        amount: dummyBalanceItem.cash,
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
