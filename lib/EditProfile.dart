
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_lover/settings.dart';

class EditProfileUser extends StatefulWidget {
  @override
  _EditProfileUserState createState() => _EditProfileUserState();
}

class _EditProfileUserState extends State<EditProfileUser> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.green,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.green,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>SettingPage()));
            },
          )
        ],
      ),
      body: _bodyUI(context),
    );
  }
}

Widget _bodyUI(BuildContext context) {
  return Container(
      padding: EdgeInsets.only(left: 16, top: 15, right: 16),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          children: [
            Text(
              "Edit Profile",
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Stack(
                children: [
                  Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 10)),
                        ],
                        image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(
                            //"data:image/jpeg;base64,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"
                            "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 1,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor)),
                        child: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildTextField("full name", "Albert Einstine", false),
            buildTextField("phone number", "017XXX", false),
            buildTextField("email", "albart.einstine@gmail.com", false),
            buildTextField("password", "******", true),
            buildTextField("address", "house#,flat#,road#,city", false),
            buildTextField("about", "about yourself", false),
SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttonFunction("CANCEL",Colors.red),
                buttonFunction("SAVE",Colors.green),
              ],
            )
          ],

        ),
      ));
}

Widget buildTextField(
    String labelText, String placeHolder, bool isPasswordTextField) {
  return Padding(
      padding: EdgeInsets.only(top: 5.0),
      child: TextField(
        obscureText: isPasswordTextField,
        decoration: InputDecoration(
            suffix: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      _EditProfileUserState ob = new _EditProfileUserState();

                      ob._showPassword=!ob._showPassword;
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.blueGrey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(top: 3),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: labelText,
            hintText: placeHolder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.blueGrey,
            ),
        labelStyle:TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w800,
          color: Colors.blueGrey,
        ) ),
      ));
}

Widget buttonFunction(String textButtonName,Color color)
{
  return OutlinedButton(
      onPressed:(){

      },
      child: Text(
        textButtonName,
        style: TextStyle(
          fontSize: 15,fontWeight: FontWeight.bold,
          letterSpacing: 2.2,
          color:color,
        ),
      ));
}
