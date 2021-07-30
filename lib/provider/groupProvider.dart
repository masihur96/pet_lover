import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:pet_lover/model/myGroup.dart';
import 'package:pet_lover/sub_screens/groups.dart';

class GroupProvider extends ChangeNotifier {
  List<MyGroup> _myGroups = [];

  get myGroups => _myGroups;

  Future<List<MyGroup>> getMyGroups(String currentMobileNo) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentMobileNo)
          .collection('myGroups')
          .orderBy('date', descending: true)
          .get();

      _myGroups.clear();

      querySnapshot.docChanges.forEach((element) {
        MyGroup myGroup = MyGroup(
            admin: element.doc['admin'],
            date: element.doc['date'],
            description: element.doc['description'],
            groupImage: element.doc['groupImage'],
            groupName: element.doc['groupName'],
            id: element.doc['id'],
            privacy: element.doc['privacy'],
            myRole: element.doc['myRole']);
        _myGroups.add(myGroup);
      });
      return _myGroups;
    } catch (error) {
      print('Cannot get myGroups - $error');
      return [];
    }
  }

  Future<void> createGroup(
      BuildContext context,
      String groupName,
      String currentMobileNo,
      File? image,
      String id,
      String privacy,
      String description) async {
    String groupImage = '';
    Reference groupStorageRef =
        FirebaseStorage.instance.ref().child('group_photos').child(id);
    if (image != null) {
      UploadTask groupPhotoUploadTask = groupStorageRef.putFile(image);
      TaskSnapshot taskSnapshot;
      groupPhotoUploadTask.then((value) {
        taskSnapshot = value;
        taskSnapshot.ref.getDownloadURL().then((imageDownloadLink) {
          groupImage = imageDownloadLink;
          saveGroupInfo(context, id, groupName, groupImage, currentMobileNo,
              privacy, description);
        });
      });
    } else {
      saveGroupInfo(context, id, groupName, groupImage, currentMobileNo,
          privacy, description);
    }
  }

  Future<void> saveGroupInfo(
      BuildContext context,
      String uuid,
      String groupName,
      String groupImage,
      String currentMobileNo,
      String privacy,
      String description) async {
    String date = DateTime.now().millisecondsSinceEpoch.toString();
    DocumentReference groupCollection =
        FirebaseFirestore.instance.collection('Groups').doc(uuid);

    DocumentReference myGroups = FirebaseFirestore.instance
        .collection('users')
        .doc(currentMobileNo)
        .collection('myGroups')
        .doc(uuid);

    await myGroups.set({
      'groupName': groupName,
      'groupImage': groupImage,
      'date': date,
      'admin': currentMobileNo,
      'id': uuid,
      'privacy': privacy,
      'description': description,
      'myRole': 'admin'
    });

    await groupCollection.set({
      'groupName': groupName,
      'groupImage': groupImage,
      'date': date,
      'admin': currentMobileNo,
      'id': uuid,
      'privacy': privacy,
      'description': description
    }).then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Groups()));
    });
  }
}
