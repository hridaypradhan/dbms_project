import 'package:dbms_project/database_helpers/budget_helper.dart';
import 'package:dbms_project/global/dummy_data.dart';
import 'package:dbms_project/models/budget_item.dart';
import 'package:dbms_project/screens/budget_screen/widgets/budget_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_coverflow/simple_coverflow.dart';

class BudgetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    List<BudgetItem> _budgetItems =
        Provider.of<BudgetHelper>(context).budgetItems;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(screenSize.width * 0.15),
                child: Text(
                  'Tentative Budget',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40.0,
                  ),
                ),
              ),
              _budgetItems.isNotEmpty
                  ? Expanded(
                      child: CoverFlow(
                        itemCount: _budgetItems.length,
                        dismissedCallback: (item, direction) {
                          Provider.of<BudgetHelper>(
                            context,
                            listen: false,
                          ).deleteBudgetItem(_budgetItems[item % _budgetItems.length].eventName);
                        },
                        itemBuilder: (BuildContext context, int index) =>
                            BudgetCard(
                          budgetItem: _budgetItems[index % _budgetItems.length],
                        ),
                      ),
                    )
                  : Expanded(
                      child: Container(
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
                        margin: EdgeInsets.all(screenSize.width * 0.03),
                        padding: EdgeInsets.all(screenSize.width * 0.03),
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              'No budget items yet. \n\nClick "Add" to enter new ones!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30.0,
                              ),
                            ),
                          ),
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
