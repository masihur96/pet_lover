import 'package:flutter/material.dart';
import 'package:pet_lover/demo_designs/profile_options.dart';

class AccountNav extends StatefulWidget {
  @override
  _AccountNavState createState() => _AccountNavState();
}

class _AccountNavState extends State<AccountNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: _bodyUI(context),
    );
  }

  Widget _bodyUI(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: size.width,
        child: Padding(
          padding: EdgeInsets.all(size.width * .04),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/profile_image.jpg'),
                    radius: size.width * .2,
                  ),
                ],
              ),
              Text(
                'Gal Gadot',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: size.width * .07,
                  fontFamily: 'MateSC',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.width * .03,
                  ),
                  Text(
                    '221B Baker Street',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: size.width * .032,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.width * .07,
              ),
              Container(
                  width: size.width,
                  //color: Colors.green,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(size.width * .04,
                        size.width * .01, size.width * .04, size.width * .01),
                    child: Card(
                      //color: Colors.deepOrange,
                      elevation: size.width * .01,
                      child: Padding(
                        padding: EdgeInsets.all(size.width * .04),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '30',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: size.width * .075,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Animals',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: size.width * .032,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '24',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: size.width * .075,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Following',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: size.width * .032,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: size.width * .07,
              ),
              ProfileOption().showOption(context, 'Add animals'),
              ProfileOption().showOption(context, 'Groups'),
              ProfileOption().showOption(context, 'My animals'),
              ProfileOption().showOption(context, 'Update account'),
              ProfileOption().showOption(context, 'Logout'),
            ],
          ),
        ),
      ),
    );
  }
}
