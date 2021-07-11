import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddAnimal extends StatefulWidget {
  @override
  _AddAnimalState createState() => _AddAnimalState();
}

class _AddAnimalState extends State<AddAnimal> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Add Animal",
            style: TextStyle(
              color: Colors.black,
              fontSize: size.width * .05,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: bodyUI(context),
    );
  }

  //body demo design
  Widget bodyUI(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //container for image or video loading
              width: size.width,
              height: size.width * .7,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300)),
              child: Center(
                child: Text(
                  'No image or video selected!',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: size.width * .05,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.width * .02,
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * .04),
              child: Row(
                children: [
                  ElevatedButton(
                      //video pick button
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.video_camera_front,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: size.width * .03,
                          ),
                          Text(
                            'Video',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * .038),
                          )
                        ],
                      )),
                  SizedBox(
                    width: size.width * .04,
                  ),
                  ElevatedButton(
                      //image pick button
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.photo_camera,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: size.width * .03,
                          ),
                          Text(
                            'Photo',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * .038),
                          )
                        ],
                      ))
                ],
              ),
            ),
            Container(
              width: size.width,
              padding: EdgeInsets.fromLTRB(size.width * .04, size.width * .06,
                  size.width * .04, size.width * .04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Animal Details',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: size.width * .05,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.width * .05),
                  Text(
                    'Pet name',
                    style: TextStyle(fontSize: size.width * .042),
                  ),
                  SizedBox(
                    height: size.width * .02,
                  ),
                  Container(
                    //textformfield for pet name input
                    width: size.width,
                    padding: EdgeInsets.only(
                        left: size.width * .04,
                        right: size.width * .04,
                        top: size.width * .02,
                        bottom: size.width * .02),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.grey)),
                    child: textFormFieldBuilder(TextInputType.text, 1),
                  ),
                  SizedBox(
                    height: size.width * .04,
                  ),
                  Text(
                    'Color',
                    style: TextStyle(fontSize: size.width * .042),
                  ),
                  SizedBox(
                    height: size.width * .02,
                  ),
                  Container(
                    //textformfield for pet color input
                    width: size.width,
                    padding: EdgeInsets.only(
                        left: size.width * .04,
                        right: size.width * .04,
                        top: size.width * .02,
                        bottom: size.width * .02),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.grey)),
                    child: textFormFieldBuilder(TextInputType.text, 1),
                  ),
                  SizedBox(
                    height: size.width * .04,
                  ),
                  Text(
                    'Genus',
                    style: TextStyle(fontSize: size.width * .042),
                  ),
                  SizedBox(
                    height: size.width * .02,
                  ),
                  Container(
                    //textformfield for genus input
                    width: size.width,
                    padding: EdgeInsets.only(
                        left: size.width * .04,
                        right: size.width * .04,
                        top: size.width * .02,
                        bottom: size.width * .02),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.grey)),
                    child: textFormFieldBuilder(TextInputType.text, 1),
                  ),
                  SizedBox(
                    height: size.width * .04,
                  ),
                  Text(
                    'Gender',
                    style: TextStyle(fontSize: size.width * .042),
                  ),
                  SizedBox(
                    height: size.width * .02,
                  ),
                  Container(
                    //textformfield for gender input
                    width: size.width,
                    padding: EdgeInsets.only(
                        left: size.width * .04,
                        right: size.width * .04,
                        top: size.width * .02,
                        bottom: size.width * .02),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.grey)),
                    child: textFormFieldBuilder(TextInputType.text, 1),
                  ),
                  SizedBox(
                    height: size.width * .04,
                  ),
                  Text(
                    'Age',
                    style: TextStyle(fontSize: size.width * .042),
                  ),
                  SizedBox(
                    height: size.width * .02,
                  ),
                  Container(
                    //textformfield for pet age input
                    width: size.width,
                    padding: EdgeInsets.only(
                        left: size.width * .04,
                        right: size.width * .04,
                        top: size.width * .02,
                        bottom: size.width * .02),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.grey)),
                    child: textFormFieldBuilder(TextInputType.text, 1),
                  ),
                  SizedBox(
                    height: size.width * .04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          //Cancel button
                          onPressed: () {},
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * .038),
                          )),
                      SizedBox(
                        width: size.width * .04,
                      ),
                      ElevatedButton(
                          //save button
                          onPressed: () {},
                          child: Text(
                            'Save',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * .038),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //textformfile demo design
  Widget textFormFieldBuilder(TextInputType keyboardType, int maxLine) {
    return TextFormField(
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        keyboardType: keyboardType,
        cursorColor: Colors.black,
        maxLines: maxLine);
  }
}
