import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FollowingNav extends StatefulWidget {
  @override
  _FollowingNavState createState() => _FollowingNavState();
}

class _FollowingNavState extends State<FollowingNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        posts(context),
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
                      size.width * .01, size.width * .02, size.width * .01),
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
        Row(
          children: [
            Padding(
              padding: EdgeInsets.all(size.width * .02),
              child: Icon(
                FontAwesomeIcons.heart,
                size: size.width * .06,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(size.width * .02, size.width * .02,
                  size.width * .02, size.width * .02),
              child: Icon(
                FontAwesomeIcons.comment,
                color: Colors.black,
                size: size.width * .06,
              ),
            ),
          ],
        ),
        Container(
            width: size.width,
            child: Padding(
              padding: EdgeInsets.fromLTRB(size.width * .02, size.width * .01,
                  size.width * .02, size.width * .01),
              child: Text(
                  'Here will be the caption of photo. Here will be the caption of photo. Here will be the caption of photo.Here will be the caption of photo.Here will be the caption of photo.'),
            )),
        ListTile(
          title: Text(
            'Add comment...',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          leading: CircleAvatar(
            backgroundImage: AssetImage(
              'assets/profile_image.jpg',
            ),
            radius: size.width * .04,
          ),
          onTap: () {},
        ),
        SizedBox(
          height: size.width * .02,
        )
      ]),
    );
  }
}
