import 'package:dbms_project/dummy_data.dart';
import 'package:dbms_project/screens/budget_screen/widgets/budget_card.dart';
import 'package:flutter/material.dart';
import 'package:simple_coverflow/simple_coverflow.dart';

class BudgetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(screenSize.width * 0.2),
                child: Text(
                  'Budget',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40.0,
                  ),
                ),
              ),
              Expanded(
                child: CoverFlow(
                  // TODO add delete function here
                  dismissedCallback: (item, direction) {},
                  itemBuilder: (BuildContext context, int index) => BudgetCard(
                    budgetItem:
                        dummyBudgetItemList[index % dummyBudgetItemList.length],
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
