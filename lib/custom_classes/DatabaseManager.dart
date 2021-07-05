import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUser(String username, String mobileNo, String address,
      String registrationDate, String profileImageLink, String password) async {
    return await usersCollection.doc(mobileNo).set({
      'username': username,
      'mobileNo': mobileNo,
      'address': address,
      'registrationDate': registrationDate,
      'profileImageLink': profileImageLink,
      'password': password
    });
  }

  Future<bool> alreadyRegisteredNumber(String mobileNo) async {
    bool exists = false;
    try {
      await usersCollection.doc(mobileNo).get().then((doc) {
        if (doc.exists) {
          exists = true;
        } else {
          exists = false;
        }
      });
      return exists;
    } catch (e) {
      print(
          'Checking mobile number registered or not problem - ${e.toString()}');
      return false;
    }
  }
}
