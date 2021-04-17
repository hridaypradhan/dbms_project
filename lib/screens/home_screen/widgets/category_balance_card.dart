import 'package:dbms_project/global/constants.dart';
import 'package:dbms_project/models/club_transaction.dart';
import 'package:flutter/material.dart';

class CategoryBalanceCard extends StatelessWidget {
  final CategoryBalance categoryBalance;

  const CategoryBalanceCard({this.categoryBalance});
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height / 4,
      width: screenSize.height / 4,
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(20.0),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          getPaymentCategoryIcon(categoryBalance.paymentCategory),
          Text(
            '₹${categoryBalance.amount}',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 40.0,
            ),
          ),
          Text(
            getCategoryName(categoryBalance),
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
