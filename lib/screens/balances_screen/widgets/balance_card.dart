import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final double amount;
  final String paymentMethod;

  const BalanceCard({this.amount, this.paymentMethod});
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(20.0),
      width: screenSize.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            _getImagePath(paymentMethod),
            height: screenSize.height * 0.2,
            width: screenSize.width * 0.5,
          ),
          Column(
            children: [
              Text(
                'BALANCE',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                '₹$amount',
                style: TextStyle(
                  fontSize: 40.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getImagePath(String paymentMethod) {
    if (paymentMethod == 'gpay')
      return 'assets/gpay.png';
    else if (paymentMethod == 'paytm')
      return 'assets/paytm.png';
    else
      return 'assets/cash.png';
  }
}
