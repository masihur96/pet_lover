import 'package:flutter/material.dart';
import 'package:pet_lover/sub_screens/create_group.dart';

class Groups extends StatefulWidget {
  const Groups({Key? key}) : super(key: key);

  @override
  _GroupsState createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Groups',
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
      body: _bodyUI(context),
    );
  }

  Widget _bodyUI(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: TabBar(
                    labelColor: Colors.deepOrange,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(
                        text: 'My groups',
                      ),
                      Tab(
                        text: 'Create group',
                      ),
                      Tab(
                        text: 'Find groups',
                      )
                    ]),
              ),
              Expanded(
                child: Container(
                  child: TabBarView(
                    children: [
                      Center(child: Text('My groups')),
                      CreateGroup(),
                      Center(child: Text('Find groups')),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
