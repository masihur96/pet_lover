import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileUser extends StatefulWidget {
  @override
  _EditProfileUserState createState() => _EditProfileUserState();
}

class _EditProfileUserState extends State<EditProfileUser> {
  bool _showPassword = false;
  final picker = ImagePicker();
  File? imageFile;
  bool _isFile = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Update profile',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: _bodyUI(context),
    );
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    } else {
      print('No profile image!');
    }
  }

  Widget _bodyUI(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        padding: EdgeInsets.only(left: 16, top: 15, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              SizedBox(height: 10),
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: size.width * .5,
                      width: size.width * .5,
                      child: CircleAvatar(
                        backgroundColor: Colors.deepOrange,
                        child: CircleAvatar(
                          radius: size.width * .245,
                          backgroundColor: Colors.white,
                          backgroundImage: imageFile == null
                              ? AssetImage('assets/profile_image.jpg')
                              : FileImage(imageFile!) as ImageProvider,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 1,
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor)),
                          child: IconButton(
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              getImage();
                            },
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              buildTextField("Username", "Albert Einstine", false),
              buildTextField("Phone number", "017XXX", false),
              buildTextField("Email", "albart.einstine@gmail.com", false),
              buildTextField("Address", "house#,flat#,road#,city", false),
              buildTextField("About", "about yourself", false),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonFunction("CANCEL", Colors.blueGrey),
                  buttonFunction("SAVE", Colors.blueGrey),
                ],
              )
            ],
          ),
        ));
  }
}

Widget buildTextField(
    String labelText, String placeHolder, bool isPasswordTextField) {
  return Padding(
      padding: EdgeInsets.only(top: 5.0),
      child: TextField(
        obscureText: isPasswordTextField,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          suffix: isPasswordTextField
              ? IconButton(
                  onPressed: () {
                    _EditProfileUserState ob = new _EditProfileUserState();

                    ob._showPassword = !ob._showPassword;
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.blueGrey,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(top: 3),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelText: labelText,
          //hintText: placeHolder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.blueGrey,
          ),
          labelStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: Colors.blueGrey,
          ),
        ),
        maxLines: labelText == 'About'
            ? 5
            : labelText == 'Address'
                ? 3
                : 1,
        minLines: 1,
        keyboardType: labelText == 'About'
            ? TextInputType.multiline
            : labelText == 'Address'
                ? TextInputType.multiline
                : TextInputType.text,
      ));
}

Widget buttonFunction(String textButtonName, Color color) {
  return OutlinedButton(
      onPressed: () {},
      child: Text(
        textButtonName,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.2,
          color: color,
        ),
      ));
}
