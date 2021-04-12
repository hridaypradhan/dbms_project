import 'package:flutter/material.dart';

class CollabsScreen extends StatefulWidget {
  static final id = 'collabs_screen';
  @override
  _CollabsScreenState createState() => _CollabsScreenState();
}

class _CollabsScreenState extends State<CollabsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Collabs'),
      ),
    );
  }
}
