import 'package:flutter/material.dart';
import 'package:pet_lover/demo_designs/profile_options.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
        child: Container(
      color: Colors.white,
      child: Column(children: [
        Container(
          width: size.width,
          height: size.height * .3,
          color: Colors.deepOrange,
          padding: EdgeInsets.only(left: size.width * .04),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: size.width * .155,
                  child: CircleAvatar(
                      radius: size.width * .15,
                      backgroundColor: Colors.white,
                      backgroundImage:
                          AssetImage('assets/profile_image_demo.png')),
                ),
                SizedBox(
                  height: size.width * .04,
                ),
                Text(
                  'Gal Gadot',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width * .07,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '221B Baker Street',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * .032,
                      fontWeight: FontWeight.bold),
                ),
              ]),
        ),
        SizedBox(
          height: size.width * .04,
        ),
        ProfileOption().showOption(context, 'Update account'),
        ProfileOption().showOption(context, 'Reset password'),
        ProfileOption().showOption(context, 'Logout'),
      ]),
    ));
  }
}
