import 'package:flutter/material.dart';

class MyAnimals extends StatefulWidget {
  @override
  _MyAnimalsState createState() => _MyAnimalsState();
}

class _MyAnimalsState extends State<MyAnimals> {
  List<String> _myAnimalsImages = [
    'assets/dog.jpg',
    'assets/dog.jpg',
    'assets/dog.jpg',
    'assets/dog.jpg',
    'assets/dog.jpg',
    'assets/dog.jpg',
    'assets/dog.jpg',
    'assets/dog.jpg',
    'assets/dog.jpg',
    'assets/dog.jpg'
  ];

  List<String> menuItems = ['Edit', 'Delete'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text(
            'Your Animals',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0.0,
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, size.width * .02),
              child: posts(context),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, size.width * .02),
              child: posts(context),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, size.width * .01),
              child: posts(context),
            ),
          ],
        ));
  }

  Widget posts(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      color: Colors.white,
      child: Column(children: [
        Container(
          width: size.width,
          child: Row(
            children: [
              Container(
                width: size.width * .8,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(size.width * .02,
                      size.width * .02, size.width * .02, size.width * .01),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          width: size.width * .12,
                          child: CircleAvatar(
                            child: Icon(
                              Icons.person,
                            ),
                            radius: 18,
                          ),
                        ),
                        SizedBox(width: size.width * .01),
                        Container(
                          width: size.width * .4,
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
                      ]),
                ),
              ),
              Container(
                  alignment: Alignment.centerRight,
                  width: size.width * .2,
                  child: Theme(
                    data: Theme.of(context).copyWith(cardColor: Colors.white),
                    child: PopupMenuButton(
                        icon: Icon(
                          Icons.more_vert,
                          color: Colors.black,
                        ),
                        itemBuilder: (context) {
                          return menuItems.map((String choice) {
                            return PopupMenuItem(
                              value: choice,
                              child: Text(
                                '$choice',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }).toList();
                        }),
                  ))
            ],
          ),
        ),
        SizedBox(
          height: size.width * .02,
        ),
        Container(
            width: size.width,
            height: size.width * .7,
            child: Image.asset(
              'assets/dog.jpg',
              fit: BoxFit.cover,
            )),
        Container(
            width: size.width,
            child: Padding(
              padding: EdgeInsets.fromLTRB(size.width * .02, size.width * .03,
                  size.width * .02, size.width * .03),
              child: Text(
                  'Here will be the caption of photo. Here will be the caption of photo. Here will be the caption of photo.Here will be the caption of photo.Here will be the caption of photo.'),
            )),
      ]),
    );
  }
}
