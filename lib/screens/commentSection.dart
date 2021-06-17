import 'dart:ui';

import 'package:flutter/material.dart';

class CommetPage extends StatefulWidget {
  const CommetPage({Key? key}) : super(key: key);

  @override
  _CommetPageState createState() => _CommetPageState();
}

class _CommetPageState extends State<CommetPage> {
  TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AppBar appBar = AppBar();
    double appbar_height = appBar.preferredSize.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        title: Text(
          'Comments',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              bottom: appbar_height,
              top: 0.0,
              child: Container(
                height: size.height - appbar_height,
                width: size.width,
                //color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0.0, size.width * .02, 0.0, size.width * .02),
                      child: _publicComments(context),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0.0, size.width * .02, 0.0, size.width * .02),
                      child: _publicComments(context),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0.0, size.width * .02, 0.0, size.width * .02),
                      child: _publicComments(context),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              child: Container(
                  width: size.width,
                  height: appbar_height,
                  color: Colors.white,
                  child: Card(
                    margin: EdgeInsets.zero,
                    clipBehavior: Clip.antiAlias,
                    elevation: size.width * .04,
                    child: Row(
                      children: [
                        Container(
                          width: size.width * .8,
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    size.width * .03, 0.0, 0.0, 0.0),
                                child: CircleAvatar(
                                  child: Icon(
                                    Icons.person,
                                  ),
                                  radius: size.width * .035,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(size.width * .03,
                                    0.0, size.width * .03, 0.0),
                                child: Container(
                                  width: size.width * .6,
                                  child: TextFormField(
                                    controller: _commentController,
                                    decoration: InputDecoration(
                                      hintText: 'Add a comment',
                                      hintStyle: TextStyle(
                                        fontSize: size.width * .038,
                                      ),
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                    cursorColor: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          width: size.width * .2,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                                0.0, 0.0, size.width * .03, 0.0),
                            child: Text(
                              'Post',
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * .038),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _publicComments(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(size.width * .03, 0.0, 0.0, 0.0),
            child: CircleAvatar(
              child: Icon(
                Icons.person,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(size.width * .03, 0.0, 0.0, 0.0),
            child: Container(
              width: size.width * .8,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: size.width * .7,
                        color: Colors.grey[200],
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              size.width * .02,
                              size.width * .02,
                              size.width * .02,
                              size.width * .02),
                          child: Text(
                            'Here will be the public comments specifically for this porst.one can react also. They can react also if they like the post.',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: size.width * .1,
                        child: Icon(
                          Icons.favorite_outline,
                          size: size.width * .03,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.width * .01,
                  ),
                  Row(
                    children: [
                      Text(
                        '14m',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: size.width * .03,
                      ),
                      Text(
                        '4',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.favorite_sharp,
                        size: size.width * .03,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
