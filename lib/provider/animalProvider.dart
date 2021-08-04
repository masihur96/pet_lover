import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pet_lover/model/Comment.dart';
import 'package:pet_lover/model/animal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnimalProvider extends ChangeNotifier {
  List<Animal> _animalList = [];
  bool _isFollower = false;
  int _numberOfFollowers = 0;
  int _numberOfComments = 0;
  int _numberOfShares = 0;
  List<Comment> _commentList = [];
  int documentLimit = 4;
  DocumentSnapshot? _startAfter;
  int _numberOfMyAnimals = 0;

  get numberOfFollowers => _numberOfFollowers;
  get animalList => _animalList;
  get isFollower => _isFollower;
  get commentList => _commentList;
  get numberOfComments => _numberOfComments;
  get numberOfMyAnimals => _numberOfMyAnimals;
  get numberOfShares => _numberOfShares;

  Future<List<Animal>> getAnimals(int limit) async {
    print('getAnimals() running');
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Animals')
          .orderBy('date', descending: true)
          .limit(limit)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        _startAfter = querySnapshot.docs.last;
        print('the _startAfter value ${_startAfter!.data()}');
      } else {
        _startAfter = null;
      }

      _animalList.clear();
      querySnapshot.docChanges.forEach((element) {
        Animal animal = Animal(
          userProfileImage: element.doc['userProfileImage'],
          username: element.doc['username'],
          mobile: element.doc['mobile'],
          age: element.doc['age'],
          color: element.doc['color'],
          date: element.doc['date'],
          gender: element.doc['gender'],
          genus: element.doc['genus'],
          id: element.doc['id'],
          petName: element.doc['petName'],
          photo: element.doc['photo'],
          totalComments: element.doc['totalComments'],
          totalFollowings: element.doc['totalFollowings'],
          totalShares: element.doc['totalShares'],
          video: element.doc['video'],
        );
        _animalList.add(animal);
      });
      return _animalList;
    } catch (error) {
      print('Error: $error');
      return [];
    }
  }

  Future<List<Animal>> getMoreAnimals(int limit) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Animals')
          .orderBy('date', descending: true)
          .limit(limit)
          .startAfterDocument(_startAfter!)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        _startAfter = querySnapshot.docs.last;
        print('after scrolling last animal ${_startAfter!.data()}');
      } else {
        _startAfter = null;
      }

      querySnapshot.docChanges.forEach((element) {
        Animal animal = Animal(
          userProfileImage: element.doc['userProfileImage'],
          username: element.doc['username'],
          mobile: element.doc['mobile'],
          age: element.doc['age'],
          color: element.doc['color'],
          date: element.doc['date'],
          gender: element.doc['gender'],
          genus: element.doc['genus'],
          id: element.doc['id'],
          petName: element.doc['petName'],
          photo: element.doc['photo'],
          totalComments: element.doc['totalComments'],
          totalFollowings: element.doc['totalFollowings'],
          totalShares: element.doc['totalShares'],
          video: element.doc['video'],
        );
        _animalList.add(animal);
      });
      return _animalList;
    } catch (error) {
      print('Error: $error');
      return [];
    }
  }

  Future<void> getNumberOfFollowers(String _animalId) async {
    try {
      await FirebaseFirestore.instance
          .collection('Animals')
          .doc(_animalId)
          .collection('followers')
          .get()
          .then((snapshot) {
        _numberOfFollowers = snapshot.docs.length;
      });
    } catch (error) {
      print('Number of followers cannot be showed - $error');
    }
  }

  Future<void> getNumberOfComments(String _animalId) async {
    try {
      await FirebaseFirestore.instance
          .collection('Animals')
          .doc(_animalId)
          .collection('comments')
          .get()
          .then((snapshot) {
        _numberOfComments = snapshot.docs.length;
      });
    } catch (error) {
      print('Number of followers cannot be showed - $error');
    }
  }

  Future<void> getNumberOfShares(String _animalId) async {
    try {
      await FirebaseFirestore.instance
          .collection('Animals')
          .doc(_animalId)
          .collection('sharingPersons')
          .get()
          .then((snapshot) {
        _numberOfShares = snapshot.docs.length;
      });
    } catch (error) {
      print('Number of shares cannot be showed - $error');
    }
  }

  Future<void> isFollowerOrNot(
      String _animalId, String _currentMobileNo) async {
    try {
      await FirebaseFirestore.instance
          .collection('Animals')
          .doc(_animalId)
          .collection('followers')
          .doc(_currentMobileNo)
          .get()
          .then((snapshot) {
        if (snapshot.exists) {
          _isFollower = true;
        } else {
          _isFollower = false;
        }
      });
    } catch (error) {
      print('is follower? - $error');
    }
  }

  Future<void> addFollowers(
      String _animalId, String _currentMobileNo, String _username) async {
    Map<String, String> followers = {'username': _username};

    try {
      await FirebaseFirestore.instance
          .collection('Animals')
          .doc(_animalId)
          .collection('followers')
          .doc(_currentMobileNo)
          .set(followers);
    } catch (error) {
      print('Adding followers error = $error');
    }
  }

  Future<void> myFollowings(
      String _currentMobileNo, String mobileNo, String username) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_currentMobileNo)
          .collection('myFollowings')
          .doc(mobileNo)
          .set({'username': username});
    } catch (error) {
      print('Cannot add in followings ... error = $error');
    }
  }

  Future<void> removeMyFollowings(String currentMobileNo, String mobile) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentMobileNo)
          .collection('myFollowings')
          .doc(mobile)
          .delete();
      print('deleted object: $mobile');
    } catch (error) {
      print(
          'Cannot delete $mobile from myFollowings of $currentMobileNo = $error');
    }
  }

  Future<void> removeFollower(String _animalId, String _currentMobileNo) async {
    try {
      await FirebaseFirestore.instance
          .collection('Animals')
          .doc(_animalId)
          .collection('followers')
          .doc(_currentMobileNo)
          .delete();
    } catch (error) {
      print('Cannot delete follower - $error');
    }
  }

  Future<void> addComment(
      String petId,
      String commentId,
      String comment,
      String animalOwnerMobileNo,
      String currentUserMobileNo,
      String date,
      String totalLikes) async {
    try {
      await FirebaseFirestore.instance
          .collection('Animals')
          .doc(petId)
          .collection('comments')
          .doc(commentId)
          .set({
        'commentId': commentId,
        'comment': comment,
        'date': date,
        'animalOwnerMobileNo': animalOwnerMobileNo,
        'commenter': currentUserMobileNo,
        'totalLikes': totalLikes
      });
    } catch (error) {
      print('Add comment failed: $error');
    }
  }

  Future<List<Animal>> getCurrentUserAnimals(String _currentMobileNo) async {
    print('getCurrentUserAnimals() running');
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(_currentMobileNo)
          .collection('my_pets')
          .orderBy('date', descending: true)
          .get();

      _animalList.clear();
      querySnapshot.docChanges.forEach((element) {
        Animal animal = Animal(
          userProfileImage: element.doc['userProfileImage'],
          username: element.doc['username'],
          mobile: element.doc['mobile'],
          age: element.doc['age'],
          color: element.doc['color'],
          date: element.doc['date'],
          gender: element.doc['gender'],
          genus: element.doc['genus'],
          id: element.doc['id'],
          petName: element.doc['petName'],
          photo: element.doc['photo'],
          totalComments: element.doc['totalComments'],
          totalFollowings: element.doc['totalFollowings'],
          totalShares: element.doc['totalShares'],
          video: element.doc['video'],
        );
        _animalList.add(animal);
      });
      return _animalList;
    } catch (error) {
      print('Error: $error');
      return [];
    }
  }

  Future<String> _getCurrentMobileNo() async {
    final _prefs = await SharedPreferences.getInstance();
    final _currentMobileNo = _prefs.getString('mobileNo') ?? null;
    print('Current Mobile no given by userProvider is $_currentMobileNo');
    return _currentMobileNo!;
  }

  Future<void> getMyAnimalsNumber() async {
    String? _currentMobileNo = await _getCurrentMobileNo();
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(_currentMobileNo)
        .collection('my_pets')
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      _numberOfMyAnimals = querySnapshot.docs.length;
    }
  }

  Future shareAnimal(String petId) async {
    String date = DateTime.now().millisecondsSinceEpoch.toString();
    String? _currentMobileNo = await _getCurrentMobileNo();
    Animal _animal = await getSpecificAnimal(petId);
    DocumentReference sharedAnimalRef = FirebaseFirestore.instance
        .collection('users')
        .doc(_currentMobileNo)
        .collection('shared_animals')
        .doc(petId);

    DocumentReference sharingPersonsRef = FirebaseFirestore.instance
        .collection('Animals')
        .doc(petId)
        .collection('sharingPersons')
        .doc(_currentMobileNo);

    sharedAnimalRef.get().then((snapshot) async {
      if (!snapshot.exists) {
        await sharedAnimalRef.set({
          'userProfileImage': _animal.userProfileImage,
          'username': _animal.username,
          'mobile': _animal.mobile,
          'age': _animal.age,
          'color': _animal.color,
          'date': _animal.date,
          'gender': _animal.gender,
          'genus': _animal.genus,
          'id': _animal.id,
          'petName': _animal.petName,
          'photo': _animal.photo,
          'totalComments': _animal.totalComments,
          'totalFollowings': _animal.totalFollowings,
          'totalShares': _animal.totalShares,
          'video': _animal.video
        });

        await sharingPersonsRef.set({
          'date': date,
        });
      }
    });
  }

  Future<Animal> getSpecificAnimal(String petId) async {
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('Animals').doc(petId).get();

    Animal animal = Animal(
      userProfileImage: documentSnapshot['userProfileImage'],
      username: documentSnapshot['username'],
      mobile: documentSnapshot['mobile'],
      age: documentSnapshot['age'],
      color: documentSnapshot['color'],
      date: documentSnapshot['date'],
      gender: documentSnapshot['gender'],
      genus: documentSnapshot['genus'],
      id: documentSnapshot['id'],
      petName: documentSnapshot['petName'],
      photo: documentSnapshot['photo'],
      totalComments: documentSnapshot['totalComments'],
      totalFollowings: documentSnapshot['totalFollowings'],
      totalShares: documentSnapshot['totalShares'],
      video: documentSnapshot['video'],
    );

    return animal;
  }

  Future<void> deleteAnimal(String petId) async {
    try {
      String currentMobileNo = await _getCurrentMobileNo();
      DocumentReference animalRef =
          FirebaseFirestore.instance.collection('Animals').doc(petId);

      DocumentReference myAnimalRef = FirebaseFirestore.instance
          .collection('users')
          .doc(currentMobileNo)
          .collection('my_pets')
          .doc(petId);

      animalRef.delete();
      myAnimalRef.delete();
    } catch (error) {
      print('Deleting animal failed - $error');
    }
  }
}
