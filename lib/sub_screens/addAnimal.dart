import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddAnimal extends StatefulWidget {
  @override
  _AddAnimalState createState() => _AddAnimalState();
}

class _AddAnimalState extends State<AddAnimal> {
  final picker = ImagePicker();
  File? fileImage;
  bool isFile = false;

  //var memoryStorage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Add Animal",
            //textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 20,
              //fontWeight: FontWeight.w500,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blueGrey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: _bodyUI(context),
    );
  }

  Widget _bodyUI(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 50, right: 16),
      // child: GestureDetector(
      //   onTap: () {
      //     FocusScope.of(context).unfocus();
      //   },
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //if(fileImage!=null)
              //buildFileImage(),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 3, color: Colors.blueGrey),
                    ),
                    //alignment: Alignment.topCenter,
                    height: MediaQuery.of(context).size.width * .7,
                    width: MediaQuery.of(context).size.width * .7,

                    child: fileImage != null
                        ? Image.file(fileImage!,
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.width * .7,
                            width: MediaQuery.of(context).size.width * .7)
                        : Center(
                            child: Text(
                              'No image selected.',
                            ),
                          ), //Icon(Icons.person)
                  ),
                  IconButton(
                      onPressed: () {
                        _getImage();
                      },
                      icon: Icon(Icons.camera_alt, color: Colors.blueGrey))
                ],
              ),
              // SizedBox(height: 10),
              // buttonUpload(),
              SizedBox(height: 20),
            ],
          ),

          SizedBox(height: 30),

          buildTextField("Animal name", "dog", false),
          buildTextField("Color", "white", false),
          buildTextField("Genere", "hybrid", false),
          buildTextField("About animal", "About animal...", false),
          //buildTextField("P", "about yourself", false),
          SizedBox(
            height: 20,
          ),

          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonFunction("CANCEL", Colors.blueGrey),
              buttonFunction("SAVE", Colors.blueGrey),
            ],
          )
        ],
      ),
    );
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
                        // _EditProfileUserState ob = new _EditProfileUserState();

                        // ob._showPassword=!ob._showPassword;
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
              // border: OutlineInputBorder(),
              //hintText: labelText,
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.blueGrey,
              ),
              labelStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Colors.blueGrey,
              )),
          cursorColor: Colors.black,
          maxLines: labelText == 'About animal' ? 5 : 1,
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

  Future _getImage() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);

    if (pickedFile != null) {
      setState(() {
        fileImage = File(pickedFile.path);
      });
    } else {
      print("image not Selected");
    }
  }
}
