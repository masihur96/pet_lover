import 'package:flutter/material.dart';
import 'package:pet_lover/model/myGroup.dart';
import 'package:pet_lover/provider/groupProvider.dart';
import 'package:pet_lover/provider/userProvider.dart';

import 'package:pet_lover/sub_screens/create_group.dart';
import 'package:pet_lover/sub_screens/groupDetail.dart';
import 'package:provider/provider.dart';

class Groups extends StatefulWidget {
  const Groups({Key? key}) : super(key: key);

  @override
  _GroupsState createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  List<MyGroup> _myGroups = [];
  int count = 0;
  String? _currentMobileNo;
  Future _customInit(
      GroupProvider groupProvider, UserProvider userProvider) async {
    setState(() {
      count++;
    });
    _currentMobileNo = await userProvider.getCurrentMobileNo();
    print('currentMobileNo = $_currentMobileNo');
    await groupProvider.getMyGroups(_currentMobileNo!).then((value) {
      setState(() {
        _myGroups = groupProvider.myGroups;
        print('total my groups = ${_myGroups.length}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final GroupProvider groupProvider = Provider.of<GroupProvider>(context);
    if (count == 0) _customInit(groupProvider, userProvider);
    return Container(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.fromLTRB(size.width * .05, size.width * .04,
                    size.width * .05, size.width * .03),
                child: searchGroupField(context)),
            Padding(
              padding: EdgeInsets.only(left: size.width * .05),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CreateGroup()));
                  },
                  child: Text('CREATE GROUP'),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(size.width * .05),
                  )))),
            ),
            Container(
              width: size.width,
              padding: EdgeInsets.only(
                  left: size.width * .05,
                  right: size.width * .05,
                  top: size.width * .02),
              child: Divider(
                color: Colors.grey,
                thickness: size.width * .002,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * .05,
                  top: size.width * .02,
                  bottom: size.width * .02),
              child: Text(
                'Your groups',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width * .045,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Container(
                  width: size.width,
                  padding: EdgeInsets.only(top: size.width * .02),
                  child: _myGroups.length == 0
                      ? Padding(
                          padding: EdgeInsets.only(
                            left: size.width * .05,
                            right: size.width * .05,
                          ),
                          child: Text('Currently you have no group.'),
                        )
                      : ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _myGroups.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GroupDetail()));
                              },
                              leading: CircleAvatar(
                                  backgroundImage:
                                      _myGroups[index].groupImage == ''
                                          ? AssetImage('assets/group_icon.png')
                                          : NetworkImage(
                                                  _myGroups[index].groupImage!)
                                              as ImageProvider,
                                  radius: size.width * .05),
                              title: Text(
                                _myGroups[index].groupName!,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: size.width * .04,
                                    fontWeight: FontWeight.w600),
                              ),
                              trailing: Text(
                                '(${_myGroups[index].myRole})',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: size.width * .04,
                                ),
                              ),
                            );
                          })),
            )
          ],
        ));
  }

  Widget searchGroupField(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.width * .05),
              color: Colors.grey[300],
            ),
            padding: EdgeInsets.fromLTRB(
                0, size.width * .02, size.width * .02, size.width * .02),
            child: TextFormField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'Group name',
                hintStyle: TextStyle(color: Colors.black),
                isDense: true,
                contentPadding: EdgeInsets.only(left: size.width * .04),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(
          width: size.width * .02,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.fromLTRB(
              size.width * .04,
              size.width * .02,
              size.width * .04,
              size.width * .02,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.width * .05),
                color: Colors.grey[300]),
            child: Text(
              'Search',
              style: TextStyle(color: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}
