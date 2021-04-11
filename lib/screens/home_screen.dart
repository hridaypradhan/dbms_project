import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static final id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
