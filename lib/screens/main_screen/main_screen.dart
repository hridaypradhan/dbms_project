import 'package:dbms_project/screens/balances_screen/balances_screen.dart';
import 'package:date_time_picker/date_time_picker.dart';

import 'package:dbms_project/screens/budget_screen/budget_screen.dart';
import 'package:dbms_project/screens/collabs_screen/collabs_screen.dart';
import 'package:dbms_project/screens/home_screen/home_screen.dart';
import 'package:dbms_project/screens/main_screen/widgets/reusable_box.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  TextEditingController _payerController,
      _payeeController,
      _descController,
      _amountController;
  int _barIndex = 0;
  String _chosenCategory, _chosenPaymentMethod, _chosenDirection;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _payeeController = TextEditingController();
    _payeeController = TextEditingController();
    _descController = TextEditingController();
    _amountController = TextEditingController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _payerController.dispose();
    _payeeController.dispose();
    _descController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Add Transaction',
                                style: TextStyle(fontSize: 25.0),
                              ),
                              TextField(
                                autofocus: true,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.name,
                                textCapitalization: TextCapitalization.words,
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
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.name,
                                textCapitalization: TextCapitalization.words,
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
                                textAlign: TextAlign.center,
                                controller: _descController,
                                keyboardType: TextInputType.multiline,
                                textCapitalization:
                                    TextCapitalization.sentences,
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ReusableBox(
                                    child: DropdownButton(
                                      value: _chosenCategory,
                                      items: <String>[
                                        'Transport',
                                        'Food',
                                        'Misc',
                                      ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                            ),
                                          );
                                        },
                                      ).toList(),
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            _chosenCategory = value;
                                          },
                                        );
                                      },
                                      hint: Text(
                                        'Category',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ReusableBox(
                                    child: DropdownButton(
                                      value: _chosenPaymentMethod,
                                      items: <String>[
                                        'GPay',
                                        'Paytm',
                                        'Cash',
                                      ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                            ),
                                          );
                                        },
                                      ).toList(),
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            _chosenPaymentMethod = value;
                                          },
                                        );
                                      },
                                      hint: Text(
                                        'Payment Via',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ReusableBox(
                                    child: DropdownButton(
                                      value: _chosenDirection,
                                      items: <String>[
                                        'Incoming',
                                        'Outgoing',
                                      ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                            ),
                                          );
                                        },
                                      ).toList(),
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            _chosenDirection = value;
                                          },
                                        );
                                      },
                                      hint: Text(
                                        'Direction',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TextField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                controller: _descController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  hintStyle: TextStyle(color: Colors.grey),
                                  hintText: 'Enter Amount',
                                ),
                              ),
                              DateTimePicker(
                                type: DateTimePickerType.dateTimeSeparate,
                                firstDate: DateTime(2021),
                                lastDate: DateTime.now(),
                                dateHintText: 'Transaction Date',
                                timeHintText: 'Time',
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.grey,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Submit'),
                              ),
                            ],
                          ),
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
}
