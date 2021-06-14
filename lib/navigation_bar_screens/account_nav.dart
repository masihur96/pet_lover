import 'package:flutter/material.dart';

class AccountNav extends StatefulWidget {
  @override
  _AccountNavState createState() => _AccountNavState();
}

class _AccountNavState extends State<AccountNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Account',
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}

