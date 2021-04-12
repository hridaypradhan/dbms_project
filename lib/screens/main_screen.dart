import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:dbms_project/screens/balances_screen/balances_screen.dart';
import 'package:dbms_project/screens/budget_screen/budget_Screen.dart';
import 'package:dbms_project/screens/collabs_screen/collabs_screen.dart';
import 'package:dbms_project/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    return Scaffold(
      bottomNavigationBar: BottomBarWithSheet(
        selectedIndex: _selectedIndex,
        onSelectItem: (index) {
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
        sheetChild: Center(
          child: Text('Sheet'),
        ),
        bottomBarTheme: BottomBarTheme(
          itemIconSize: 40.0,
          mainButtonPosition: MainButtonPosition.Middle,
        ),
        mainActionButtonTheme: MainActionButtonTheme(
          size: 40.0,
          icon: Icon(Icons.add),
        ),
        items: [
          BottomBarWithSheetItem(
            icon: Icons.home_rounded,
            label: 'Home',
          ),
          BottomBarWithSheetItem(
            icon: Icons.bar_chart_rounded,
            label: 'Balances',
          ),
          BottomBarWithSheetItem(
            icon: Icons.star_rounded,
            label: 'Collabs',
          ),
          BottomBarWithSheetItem(
            icon: Icons.money_rounded,
            label: 'Budget',
          ),
        ],
      ),
      body: PageView(
        children: [
          HomeScreen(),
          BalancesScreen(),
          CollabsScreen(),
          BudgetScreen(),
        ],
      ),
    );
  }
}
