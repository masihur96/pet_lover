import 'package:flutter/material.dart';

class FollowingNav extends StatefulWidget {
  @override
  _FollowingNavState createState() => _FollowingNavState();
}

class _FollowingNavState extends State<FollowingNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Following',
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
