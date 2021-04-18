import 'package:dbms_project/database_helpers/balances_helper.dart';
import 'package:dbms_project/database_helpers/budget_helper.dart';
import 'package:dbms_project/database_helpers/club_transaction_helper.dart';
import 'package:dbms_project/database_helpers/collab_helper.dart';
import 'package:dbms_project/database_helpers/database_helper.dart';
import 'package:dbms_project/database_helpers/initialization_helper.dart';
import 'package:dbms_project/screens/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    _databaseHelper.initializeDatabase().then(
          (value) => print('Database initialised!'),
        );

    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ],
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ClubTransactionHelper>(
          create: (context) => ClubTransactionHelper(),
        ),
        ChangeNotifierProvider<BudgetHelper>(
          create: (context) => BudgetHelper(),
        ),
        ChangeNotifierProvider<BalancesHelper>(
          create: (context) => BalancesHelper(),
        ),
        ChangeNotifierProvider<CollabHelper>(
          create: (context) => CollabHelper(),
        ),
        ChangeNotifierProvider<InitializationHelper>(
          create: (context) => InitializationHelper(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: MainScreen(),
      ),
    );
  }
}
