import 'package:flutter/material.dart';

class CommentsDemo extends StatefulWidget {
  String comment;
  CommentsDemo({Key? key, required this.comment}) : super(key: key);

  @override
  _CommentsDemoState createState() => _CommentsDemoState(comment);
}

class _CommentsDemoState extends State<CommentsDemo> {
  String comment;

  _CommentsDemoState(this.comment);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      padding: EdgeInsets.only(top: size.width * .03, bottom: size.width * .03),
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
                        alignment: Alignment.centerLeft,
                        width: size.width * .7,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius:
                                BorderRadius.circular(size.width * .02)),
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(
                                size.width * .03,
                                size.width * .02,
                                size.width * .03,
                                size.width * .02),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'username',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * .04),
                                ),
                                Text(
                                  comment,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: size.width * .04),
                                ),
                              ],
                            )),
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
