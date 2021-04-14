import 'package:flutter/material.dart';

class CollabsScreen extends StatelessWidget {
  static final id = 'collabs_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListTile(
          leading: Image.network(
            'https://ecellsnu.com/assets/img/1234.png',
          ),
          title: Text(
            'E-Summit',
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
          trailing: Icon(Icons.chevron_right_rounded),
        ),
      ),
    );
  }
}
