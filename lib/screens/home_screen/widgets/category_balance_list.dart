import 'package:dbms_project/constants.dart';
import 'package:flutter/material.dart';

class CategoryBalanceList extends StatelessWidget {
  final Map balances;

  const CategoryBalanceList({this.balances});
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return ListView.builder(
        itemCount: balances.length,
        itemBuilder: (context, index) {
          var 
          return Container(
            height: screenSize.height / 4,
            width: screenSize.height / 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('₹'),
              ],
            ),
          );
        });
  }
}
