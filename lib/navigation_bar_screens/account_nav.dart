import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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


  Widget _bodyUI(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: size.width,
        child: Padding(
          padding:  EdgeInsets.all(size.width*.04),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/profile_image.jpg'),
                  radius: size.width*.2,
                ),
              ],),
              Text(
                      'Gal Gadot',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: size.width*.07,
                        fontFamily: 'MateSC',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: size.width*.03,),
                        Text(
                      '221B Baker Street',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: size.width*.032,
                      ),
                    ),
                      ],
                    ),
              SizedBox(height:size.width*.07 ,),
              Container(
                width: size.width,
                //color: Colors.green,
                child: Padding(
                  padding:  EdgeInsets.fromLTRB(size.width*.04, size.width*.01,size.width*.04, size.width*.01),
                  child: Card(
                    //color: Colors.deepOrange,
                    elevation:size.width*.01,
                    child: Padding(
                      padding:  EdgeInsets.all(size.width*.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                      Column(children: [
                        Text(
                          '0',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: size.width*.075,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Animals',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: size.width*.032,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],),
                    
                      Column(children: [
                        Text(
                          '0',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: size.width*.075,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Following',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: size.width*.032,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],),
                      ],
                      ),
                    ),
                  ),
                )
              ),
              SizedBox(height:size.width*.07 ,),
              Container(
                width: size.width,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0, size.width*.02, 0.0, size.width*.02),
                  child: Row(
                    children: [
                      Container(
                        width: size.width*.7,
                        child: Row(
                          children: [
                            Icon(
                            Icons.add_circle_outline_sharp,
                            color: Colors.red,
                            size: size.width*.06,
                      ),
                      SizedBox(width: size.width*.03,),
                      Text(
                        'Add animals',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        width: size.width*.2,
                        child: Icon(
                            Icons.chevron_right,
                            color: Colors.black,
                            size: size.width*.06,
                      ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.width*.02,),
              Divider(
                  height: size.width*.02,
                  color: Colors.grey,
              ),
              Container(
                width: size.width,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0, size.width*.02, 0.0, size.width*.02),
                  child: Row(
                    children: [
                      Container(
                        width: size.width*.7,
                        child: Row(
                          children: [
                            Icon(
                            Icons.favorite_outline,
                            color: Colors.red,
                            size: size.width*.06,
                      ),
                      SizedBox(width: size.width*.03,),
                      Text(
                        'My animals',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        width: size.width*.2,
                        child: Icon(
                            Icons.chevron_right,
                            color: Colors.black,
                            size: size.width*.06,
                      ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.width*.02,),
              Divider(
                  height: size.width*.02,
                  color: Colors.grey,
              ),
              Container(
                width: size.width,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0, size.width*.02, 0.0, size.width*.02),
                  child: Row(
                    children: [
                      Container(
                        width: size.width*.7,
                        child: Row(
                          children: [
                            Icon(
                            Icons.edit,
                            color: Colors.red,
                            size: size.width*.06,
                      ),
                      SizedBox(width: size.width*.03,),
                      Text(
                        'Update account',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        width: size.width*.2,
                        child: Icon(
                            Icons.chevron_right,
                            color: Colors.black,
                            size: size.width*.06,
                      ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.width*.02,),
              Divider(
                  height: size.width*.02,
                  color: Colors.grey,
              ),
               Container(
                width: size.width,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0, size.width*.02, 0.0, size.width*.02),
                  child: Row(
                    children: [
                      Container(
                        width: size.width*.7,
                        child: Row(
                          children: [
                            Icon(
                            Icons.vpn_key_outlined,
                            color: Colors.red,
                            size: size.width*.06,
                      ),
                      SizedBox(width: size.width*.03,),
                      Text(
                        'Reset Password',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        width: size.width*.2,
                        child: Icon(
                            Icons.chevron_right,
                            color: Colors.black,
                            size: size.width*.06,
                      ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.width*.02,),
              Divider(
                  height: size.width*.02,
                  color: Colors.grey,
              ),
               Container(
                width: size.width,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0, size.width*.02, 0.0, size.width*.02),
                  child: Row(
                    children: [
                           Icon(
                            Icons.logout,
                            color: Colors.red,
                            size: size.width*.06,
                      ),
                      SizedBox(width: size.width*.03,),
                      Text(
                        'Log out',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}

