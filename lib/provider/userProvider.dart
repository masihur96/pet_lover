import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  Map<String, String> _currentUserMap = {};
  int _mFollowing = 0;

  get currentUserMap => _currentUserMap;
  get mFollowing => _mFollowing;

  Future<void> getCurrentUserInfo() async {
    String? _currentMobileNo = await getCurrentMobileNo();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(_currentMobileNo)
        .get()
        .then((snapshot) {
      _currentUserMap = {
        'about': snapshot['about'],
        'address': snapshot['address'],
        'mobileNo': snapshot['mobileNo'],
        'passowrd': snapshot['password'],
        'profileImageLink': snapshot['profileImageLink'],
        'registrationDate': snapshot['registrationDate'],
        'username': snapshot['username']
      };
    });
  }

  Future<String> getCurrentMobileNo() async {
    final _prefs = await SharedPreferences.getInstance();
    final _currentMobileNo = _prefs.getString('mobileNo') ?? null;
    print('Current Mobile no given by userProvider is $_currentMobileNo');
    return _currentMobileNo!;
  }

  Future<void> getMyFollowingsNumber() async {
    String? _currentMobileNo = await getCurrentMobileNo();
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(_currentMobileNo)
        .collection('myFollowings')
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      _mFollowing = querySnapshot.docs.length;
    }
  }
}
