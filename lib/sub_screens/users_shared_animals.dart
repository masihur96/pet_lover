import 'package:flutter/material.dart';

class UserSharedAnimals extends StatefulWidget {
  String userMobileNo;
  String username;
  UserSharedAnimals(
      {Key? key, required this.userMobileNo, required this.username})
      : super(key: key);

  @override
  _UserSharedAnimalsState createState() =>
      _UserSharedAnimalsState(userMobileNo, username);
}

class _UserSharedAnimalsState extends State<UserSharedAnimals> {
  String userMobileNo;
  String username;
  _UserSharedAnimalsState(this.userMobileNo, this.username);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Shared Animals',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
      ),
    );
  }
}
