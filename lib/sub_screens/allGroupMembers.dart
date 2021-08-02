import 'package:flutter/material.dart';
import 'package:pet_lover/model/member.dart';
import 'package:pet_lover/provider/groupProvider.dart';
import 'package:pet_lover/provider/userProvider.dart';
import 'package:provider/provider.dart';

class AllGroupMembers extends StatefulWidget {
  String groupId;
  AllGroupMembers({Key? key, required this.groupId}) : super(key: key);

  @override
  _AllGroupMembersState createState() => _AllGroupMembersState(groupId);
}

class _AllGroupMembersState extends State<AllGroupMembers> {
  String groupId;
  _AllGroupMembersState(this.groupId);
  List<Member> _allMembers = [];
  int count = 0;
  Map<String, String> _currentUserInfo = {};
  Map<String, String> _groupInfo = {};
  TextEditingController _usernameController = TextEditingController();
  _customInit(GroupProvider groupProvider, String groupId,
      UserProvider userProvider) async {
    _getAllMembers(groupProvider, groupId);
    setState(() {
      _currentUserInfo = userProvider.currentUserMap;
      _groupInfo = groupProvider.groupInfo;
      print('${_currentUserInfo['mobileNo']} & ${_groupInfo['admin']}');
      count++;
    });
  }

  _getAllMembers(GroupProvider groupProvider, String groupId) async {
    await groupProvider.getAllMembers(groupId).then((value) {
      setState(() {
        _allMembers = groupProvider.members;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Group members',
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
      body: _bodyUi(context),
    );
  }

  Widget _bodyUi(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final GroupProvider groupProvider = Provider.of<GroupProvider>(context);
    if (count == 0) _customInit(groupProvider, groupId, userProvider);
    return Container(
        child: Column(
      children: [],
    ));
  }

  Widget searchGroupField(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final GroupProvider groupProvider = Provider.of<GroupProvider>(context);
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
              controller: _usernameController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'Mobile number',
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
          onTap: () {
            setState(() {});
          },
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
// ListView.builder(
//         itemCount: _allMembers.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//               leading: CircleAvatar(
//                 backgroundImage: {_allMembers[index].profileImageLink} == ''
//                     ? AssetImage('assets/profile_image_demo.png')
//                     : NetworkImage(_allMembers[index].profileImageLink)
//                         as ImageProvider,
//               ),
//               title: Text(_allMembers[index].username),
//               trailing: ((_allMembers[index].mobileNo != _groupInfo['admin']) &&
//                       (_groupInfo['admin'] == _currentUserInfo['mobileNo']))
//                   ? TextButton(onPressed: () {}, child: Text('Remove'))
//                   : null);
//         });
