import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pet_lover/model/animal.dart';

class AnimalProvider extends ChangeNotifier {
  List<Animal> _animalList = [];

  int _numberOfFollowers = 0;

  get numberOfFollowers => _numberOfFollowers;

  get animalList => _animalList;

  Future<List<Animal>> getAnimals() async {
    try {
      await FirebaseFirestore.instance
          .collection('Animals')
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

  Future<void> getNumberOfFollowers() async {}

  Future<void> addFollowers(String _animalId, String _currentMobileNo) async {
    // try {
    //   await FirebaseFirestore.instance
    //       .collection('Animals')
    //       .doc(_animalId)
    //       .collection('followers')
    //       .doc(_currentMobileNo)

    // } catch (error) {
    //   print('Adding followers error = $error');
    // }
  }
}
