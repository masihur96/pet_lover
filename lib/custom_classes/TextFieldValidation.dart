import 'package:flutter/material.dart';

class TextFieldValidation {
  bool mobileNoValidate(String _mobileNo) {
    if (_mobileNo.length != 11) {
      return false;
    } else {
      return true;
    }
  }

  bool passwordValidation(String _password) {
    if (_password.length < 6) {
      return false;
    } else {
      return true;
    }
  }
}
