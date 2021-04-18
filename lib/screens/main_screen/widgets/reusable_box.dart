import 'package:flutter/material.dart';

class ReusableBox extends StatelessWidget {
  final Widget child;

  const ReusableBox({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
            width: 1,
            color: Colors.white                
            ),
      ),
      child: child,
    );
  }
}
