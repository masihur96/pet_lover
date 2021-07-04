import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_lover/sub_screens/EditProfile.dart';
import 'package:pet_lover/sub_screens/addAnimal.dart';
import 'package:pet_lover/sub_screens/groups.dart';
import 'package:pet_lover/sub_screens/my_animals.dart';

class ProfileOption {
  Widget showOption(BuildContext context, String title) {
    return ListTile(
        title: Text(
          '$title',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: title == 'Add animals'
            ? Icon(
                Icons.add_circle_outline_sharp,
                color: Colors.deepOrange,
              )
            : title == 'Groups'
                ? Icon(
                    Icons.group,
                    color: Colors.deepOrange,
                  )
                : title == 'My animals'
                    ? Icon(
                        FontAwesomeIcons.paw,
                        color: Colors.deepOrange,
                      )
                    : title == 'Update account'
                        ? Icon(
                            Icons.edit,
                            color: Colors.deepOrange,
                          )
                        : Icon(
                            Icons.logout,
                            color: Colors.deepOrange,
                          ),
        trailing: title != 'Logout'
            ? Icon(
                Icons.chevron_right,
                color: Colors.black,
              )
            : null,
        onTap: () {
          title == 'Add animals'
              // ignore: unnecessary_statements
              ? {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddAnimal()))
                }
              : title == 'Groups'
                  // ignore: unnecessary_statements
                  ? {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Groups()))
                    }
                  : title == 'My animals'
                      // ignore: unnecessary_statements
                      ? {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyAnimals()))
                        }
                      : title == 'Update account'
                          // ignore: unnecessary_statements
                          ? {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditProfileUser()))
                            }
                          // ignore: unnecessary_statements
                          : {};
        });
  }
}
