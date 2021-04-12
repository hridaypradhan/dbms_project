import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:dbms_project/constants.dart';
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
  PageController _pageController;
  TextEditingController _payerController, _payeeController, _descController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _payeeController = TextEditingController();
    _payeeController = TextEditingController();
    _descController = TextEditingController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _payerController.dispose();
    _payeeController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    // TODO fix index changes
    int _barIndex = 0;

    return Scaffold(
      bottomNavigationBar: BottomBarWithSheet(
        selectedIndex: _barIndex,
        onSelectItem: (index) {
          setState(
            () {
              _barIndex = index;
              _pageController.jumpToPage(index);
            },
          );
        },
        // TODO fix render flex
        sheetChild: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Add Transaction',
              style: TextStyle(fontSize: 25.0),
            ),
            TextField(
              controller: _payerController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintStyle: TextStyle(color: Colors.grey),
                hintText: 'Enter Payer\'s Name',
              ),
            ),
            TextField(
              controller: _payeeController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintStyle: TextStyle(color: Colors.grey),
                hintText: 'Enter Payee\'s Name',
              ),
            ),
            TextField(
              controller: _descController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintStyle: TextStyle(color: Colors.grey),
                hintText: 'Enter Description',
              ),
            ),
          ],
        ),
        bottomBarTheme: BottomBarTheme(
          contentPadding: EdgeInsets.all(8.0),
          heightOpened: screenSize.height * 0.9,
          backgroundColor: Colors.black,
          selectedItemBackgroundColor: Colors.grey,
          selectedItemLabelColor: Colors.white,
          itemIconSize: 40.0,
          mainButtonPosition: MainButtonPosition.Middle,
        ),
        mainActionButtonTheme: MainActionButtonTheme(
          color: Colors.grey,
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
        controller: _pageController,
        onPageChanged: (index) {
          setState(
            () {
              _barIndex = index;
              print('Changed');
            },
          );
        },
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
