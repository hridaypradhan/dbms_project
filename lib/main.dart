import 'package:dbms_project/database_helpers/database_helper.dart';
import 'package:dbms_project/screens/balances_screen/balances_screen.dart';
import 'package:dbms_project/screens/collabs_screen/collabs_screen.dart';
import 'package:dbms_project/screens/home_screen/home_screen.dart';
import 'package:dbms_project/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    _databaseHelper.initializeDatabase().then(
          (value) => print('Database initialised!'),
        );

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MainScreen(),
    );
  }
}
