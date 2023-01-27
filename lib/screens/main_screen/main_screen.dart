import '../../database_helpers/initialization_helper.dart';
import '../balances_screen/balances_screen.dart';
import '../budget_screen/budget_screen.dart';
import '../budget_screen/widgets/add_budget_item_form.dart';
import '../collabs_screen/collabs_screen.dart';
import '../collabs_screen/widgets/add_collab_form.dart';
import '../home_screen/home_screen.dart';
import '../home_screen/widgets/add_transaction_form.dart';
import 'widgets/add_initial_data_form.dart';
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
    Provider.of<InitializationHelper>(context).checkInitialization();
    return Provider.of<InitializationHelper>(context).dataInitialized
        ? Scaffold(
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
                int prevPage = _pageController.page.toInt();
                setState(
                  () {
                    if (index > 2)
                      _pageController.jumpToPage(index - 1);
                    else if (index < 2) _pageController.jumpToPage(index);

                    _barIndex = index;
                    if (index == 2) {
                      if (_pageController.page != 1)
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
                                  child: _getForm(prevPage),
                                );
                              },
                            );
                          },
                        );
                      _pageController.jumpToPage(prevPage);
                      _barIndex = prevPage >= 2 ? prevPage + 1 : prevPage;
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
          )
        : AddInitialDataForm();
  }

  _getForm(int prevPage) {
    if (_pageController.page == 0 || _pageController.page == 1)
      return AddTransactionForm();
    else if (_pageController.page == 3)
      return AddBudgetItemForm();
    else if (_pageController.page == 2) return AddCollabForm();
  }
}
