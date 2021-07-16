import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_lover/demo_designs/animal_post.dart';
import 'package:pet_lover/model/animal.dart';
import 'package:pet_lover/provider/animalProvider.dart';
import 'package:pet_lover/provider/userProvider.dart';
import 'package:provider/provider.dart';

class HomeNav extends StatefulWidget {
  @override
  _HomeNavState createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  int _count = 0;
  List<Animal> _animalLists = [];
  String? finalDate;
  Map<String, String> _currentUserInfoMap = {};

  Future<void> _customInit(
      AnimalProvider animalProvider, UserProvider userProvider) async {
    setState(() {
      _count++;
    });

    await userProvider.getCurrentUserInfo().then((value) {
      _currentUserInfoMap = userProvider.currentUserMap;
    });

    await animalProvider.getAnimals().then((value) {
      setState(() {
        _animalLists = animalProvider.animalList;
        print(_animalLists);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final AnimalProvider animalProvider = Provider.of<AnimalProvider>(context);
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    if (_count == 0) _customInit(animalProvider, userProvider);

    return ListView.builder(
      itemCount: _animalLists.length,
      itemBuilder: (context, index) {
        DateTime miliDate = new DateTime.fromMillisecondsSinceEpoch(
            int.parse(_animalLists[index].date!));
        var format = new DateFormat("yMMMd").add_jm();
        finalDate = format.format(miliDate);
        // return AnimalPost().postAnimal(
        //     context,
        //     _animalLists[index].userProfileImage!,
        //     _animalLists[index].username!,
        //     finalDate!,
        //     _animalLists[index].totalFollowings!,
        //     _animalLists[index].totalComments!,
        //     _animalLists[index].totalShares!,
        //     _animalLists[index].petName!,
        //     _animalLists[index].genus!,
        //     _animalLists[index].gender!,
        //     _animalLists[index].age!,
        //     _animalLists[index].photo!,
        //     _animalLists[index].video!,
        //     _currentUserInfoMap['profileImageLink']!);

        return AnimalPost(
            profileImageLink: _animalLists[index].userProfileImage!,
            username: _animalLists[index].username!,
            date: finalDate!,
            numberOfLoveReacts: _animalLists[index].totalFollowings!,
            numberOfComments: _animalLists[index].totalComments!,
            numberOfShares: _animalLists[index].totalShares!,
            petName: _animalLists[index].petName!,
            petGenus: _animalLists[index].genus!,
            petGender: _animalLists[index].gender!,
            petAge: _animalLists[index].age!,
            petImage: _animalLists[index].photo!,
            petVideo: _animalLists[index].video!,
            currentUserImage: _currentUserInfoMap['profileImageLink']!);
      },
    );
  }
}
