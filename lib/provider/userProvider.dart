import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  Map<String, String> _currentUserMap = {};

  get currentUserMap => _currentUserMap;

  Future<void> getCurrentUserInfo() async {
    String? _currentMobileNo = await _getCurrentMobileNo();
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

  Future<String> _getCurrentMobileNo() async {
    final _prefs = await SharedPreferences.getInstance();
    final _currentMobileNo = _prefs.getString('mobileNo') ?? null;
    print('Current Mobile no is $_currentMobileNo');
    return _currentMobileNo!;
  }
}
