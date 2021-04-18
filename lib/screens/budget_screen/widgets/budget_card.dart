import 'package:dbms_project/models/budget_item.dart';
import 'package:flutter/material.dart';

class BudgetCard extends StatelessWidget {
  final BudgetItem budgetItem;
  BudgetCard({this.budgetItem});
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 3.0,
          ),
        ],
      ),
      width: screenSize.width * 0.8,
      height: screenSize.height * 0.6,
      padding: EdgeInsets.all(screenSize.width * 0.03),
      margin: EdgeInsets.all(screenSize.width * 0.03),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FittedBox(
              child: Text(
                budgetItem.eventName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50.0,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            Text(
              'Tentative cost: ₹${budgetItem.amount} \nTentative date: ${budgetItem.dateTime.day}/${budgetItem.dateTime.month}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Text(
              budgetItem.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Text(
              '(Swipe up or down to delete)',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
