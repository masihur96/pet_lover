import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeNav extends StatefulWidget {
  @override
  _HomeNavState createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {

  TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: posts(context),
    );
  }


  Widget publicPost(BuildContext context){
    Size size = MediaQuery
        .of(context)
        .size;
    return Padding(
      padding:  EdgeInsets.fromLTRB(size.width*.04, 8.0, 10.0, 0.0),
      child: Column(
        children: [
          Container(
            height: size.width*.14,
            width: size.width,
            child: Stack(
              children: [
                Positioned(
                  left: 0.0,
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.person,
                        ),
                        radius: 24.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Username here',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 2.0,),
                            Row(
                              children: [
                                Text(
                                  '12.06.2021',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                  ),
                                ),
                                SizedBox(width: 10.0,),
                                Text(
                                  '01:29',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                  ),
                                ),
                                Text(
                                  'pm',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 0.0,
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
            child: Container(
              height: size.width*.6,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/dog.jpg'
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 2.0),
                  child: Icon(
                    Icons.favorite_outline,
                    size: 28.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 2.0, 0.0, 2.0),
                  child: Icon(
                    Icons.comment_bank_outlined,
                    size: 28.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.0,),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    child: Text(
                      'The caption can be right here...The caption can be right here...The caption can be right here...The caption can be right here...The caption can be right here...',
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          Container(
            width: size.width,
            height: size.width*.14,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0.0,
                  child: Container(
                    width: size.width*.8,
                    child: _textFormBuilder('Add comment'),
                  ),
                ),
                Positioned(
                  right: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(2, 2, 0, 2),
                    child: Icon(
                      Icons.send,
                      color: Colors.deepOrange,
                      size: 30.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _textFormBuilder(String hint) {
    return TextFormField(
      controller: _commentController,
      validator: (value) {
        if (value!.isEmpty)
          return 'Enter $hint';
        else
          return null;
      },
      decoration: InputDecoration(
        hintText: hint,
      ),
      cursorColor: Colors.black,
    );
  }

  Widget posts(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0,0.0),
            child: Row(
              children: [
                Container(
                  width: size.width*.8,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        width: size.width*.12,
                        child: CircleAvatar(
                          child: Icon(
                            Icons.person,
                          ),
                          radius: 18,
                        ),
                      ),
                      SizedBox(width: size.width *.01 ),
                      Container(
                        width: size.width*.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Username',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '2 jun 10 2021 February 24',
                              style: TextStyle(
                                //fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      )
                    ]
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  width: size.width*.15,
                  child: Icon(
                    Icons.more_vert,
                   color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: size.width*.02,
          ),
          Container(
            width: size.width,
            height: size.width*.7,
            child: Image.asset(
              'assets/dog.jpg',
              fit: BoxFit.cover,
            )
          ),
          Row(
            children: [
              Padding(
                padding:  EdgeInsets.all(size.width*.02),
                child: Icon(
                  FontAwesomeIcons.heart,
                  size: size.width*.06,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding:  EdgeInsets.fromLTRB(size.width*.02, size.width*.02, size.width*.02, size.width*.02),
                child: Icon(
                  FontAwesomeIcons.comment,
                  color:Colors.black,
                  size: size.width*.06,
                ),
              ),
            ],
          ),
          Container(
            width: size.width,
            child: Padding(
              padding:  EdgeInsets.fromLTRB(size.width*.02, size.width*.01, size.width*.02, size.width*.01),
              child: Text(
                'Here will be the caption of photo. Here will be the caption of photo. Here will be the caption of photo.Here will be the caption of photo.Here will be the caption of photo.'
              ),
            )
          ),
          Container(
            width: size.width,
            child: Padding(
              padding:  EdgeInsets.fromLTRB(size.width*.02, 0.0, size.width*.02, size.width*.00),
              child: Row(children: [
                Container(
                  width: size.width*.6,
                  //color: Colors.green,
                  child: Row(
                    children : [
                      Container(
                        width: size.width*.06,
                        //color: Colors.blue,
                        child: CircleAvatar(
                          child: Icon(
                            Icons.person,
                          ),
                        ),
                      ),
                      Container(
                        width: size.width*.3,
                        //color: Colors.yellow,
                        child: Padding(
                          padding:  EdgeInsets.fromLTRB(size.width*.03, 0.0, 0.0, 0.0),
                          child: Text(
                            'Add a comment...',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      )
                    ]
                  ),
                ),
                Container(
                  width: size.width*.35,
                  height: size.width*.045,
                  //color: Colors.yellow,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:  EdgeInsets.fromLTRB(size.width*.03, 0.0, size.width*.03, 0.0),
                        child: Icon(
                          Icons.favorite_sharp,
                          color: Colors.red,
                          size: size.width*.045,
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.fromLTRB(size.width*.01, 0.0, size.width*.03, 0.0),
                        child: Icon(
                          Icons.thumb_up_sharp,
                          color: Colors.red,
                          size: size.width*.045,
                        ),
                      )
                    ],
                  )
                )
                ]
              ),
            )
          )
        ]
      ),
    );
  }
}
