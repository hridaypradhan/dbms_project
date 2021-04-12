import 'package:flutter/material.dart';

class BalancesScreen extends StatefulWidget {
  static final id = 'balances_screen';
  @override
  _BalancesScreenState createState() => _BalancesScreenState();
}

class _BalancesScreenState extends State<BalancesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Balances'),
      ),
    );
  }
}
