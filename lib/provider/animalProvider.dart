import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pet_lover/model/Comment.dart';
import 'package:pet_lover/model/animal.dart';

class AnimalProvider extends ChangeNotifier {
  List<Animal> _animalList = [];
  bool _isFollower = false;
  int _numberOfFollowers = 0;
  int _numberOfComments = 0;
  List<Comment> _commentList = [];

  get numberOfFollowers => _numberOfFollowers;
  get animalList => _animalList;
  get isFollower => _isFollower;
  get commentList => _commentList;
  get numberOfComments => _numberOfComments;

  Future<List<Animal>> getAnimals() async {
    try {
      await FirebaseFirestore.instance
          .collection('Animals')
          .orderBy('date', descending: true)
          .limit(2)
          .get()
          .then((snapshot) {
        _animalList.clear();
        snapshot.docChanges.forEach((element) {
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
}
