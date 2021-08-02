import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  Map<String, String> _currentUserMap = {};
  int _mFollowing = 0;
  Map<String, String> _specificUserMap = {};
  bool _isUserExists = false;
  String _currentUserMobile = '';

  get currentUserMap => _currentUserMap;
  get mFollowing => _mFollowing;
  get specificUserMap => _specificUserMap;
  get isUserExists => _isUserExists;
  get currentUserMobile => _currentUserMobile;
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
    _currentUserMobile = _currentMobileNo!;
    print('Current Mobile no given by userProvider is $_currentMobileNo');
    return _currentMobileNo;
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

  Future<void> getSpecificUserInfo(String mobileNo) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(mobileNo)
          .get()
          .then((snapshot) {
        if (snapshot.exists) {
          _specificUserMap = {
            'about': snapshot['about'],
            'address': snapshot['address'],
            'mobileNo': snapshot['mobileNo'],
            'passowrd': snapshot['password'],
            'profileImageLink': snapshot['profileImageLink'],
            'registrationDate': snapshot['registrationDate'],
            'username': snapshot['username']
          };
          _isUserExists = true;
        } else {
          _isUserExists = false;
        }
      });
    } catch (error) {
      print('searching people failed - $error');
      _isUserExists = false;
    }
  }
}
