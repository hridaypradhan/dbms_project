import 'package:dbms_project/database_helpers/club_transaction_helper.dart';
import 'package:dbms_project/screens/balances_screen/balances_screen.dart';
import 'package:dbms_project/screens/budget_screen/budget_screen.dart';
import 'package:dbms_project/screens/collabs_screen/collabs_screen.dart';
import 'package:dbms_project/screens/home_screen/home_screen.dart';
import 'package:dbms_project/screens/main_screen/widgets/add_transaction_form.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;

  int _barIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO remove
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // DatabaseHelper().showClubTransactionTable();
          var list = Provider.of<ClubTransactionHelper>(
            context,
            listen: false,
          ).clubTransactions;
          for (var ele in list) {
            print(ele.toMap());
          }
        },
      ),
      bottomNavigationBar: FFNavigationBar(
        selectedIndex: _barIndex,
        items: [
          FFNavigationBarItem(
            iconData: Icons.home_rounded,
            label: 'Home',
          ),
          FFNavigationBarItem(
            iconData: Icons.bar_chart_rounded,
            label: 'Balances',
          ),
          FFNavigationBarItem(
            iconData: Icons.add,
            label: 'Add',
          ),
          FFNavigationBarItem(
            iconData: Icons.star_rounded,
            label: 'Collabs',
          ),
          FFNavigationBarItem(
            iconData: Icons.money_rounded,
            label: 'Budget',
          ),
        ],
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.black,
          selectedItemBackgroundColor: Colors.grey,
          selectedItemLabelColor: Colors.white,
        ),
        onSelectTab: (index) {
          setState(
            () {
              if (index > 2)
                _pageController.jumpToPage(index - 1);
              else if (index < 2) _pageController.jumpToPage(index);
              _barIndex = index;
              if (index == 2) {
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: _getForm(),
                        );
                      },
                    );
                  },
                );
                _pageController.jumpToPage(0);
                _barIndex = 0;
              }
            },
          );
        },
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(
            () {
              _barIndex = index > 1 ? index + 1 : index;
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

  _getForm() {
    if (_barIndex == 0) return AddTransactionForm();
    else return Container();
  }
}
