import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_lover/sub_screens/commentSection.dart';
import 'package:video_player/video_player.dart';

class AnimalPost extends StatefulWidget {
  String profileImageLink;
  String username;
  String date;
  String numberOfLoveReacts;
  String numberOfComments;
  String numberOfShares;
  String petName;
  String petGenus;
  String petGender;
  String petAge;
  String petImage;
  String petVideo;
  String currentUserImage;
  AnimalPost(
      {Key? key,
      required this.profileImageLink,
      required this.username,
      required this.date,
      required this.numberOfLoveReacts,
      required this.numberOfComments,
      required this.numberOfShares,
      required this.petName,
      required this.petGenus,
      required this.petGender,
      required this.petAge,
      required this.petImage,
      required this.petVideo,
      required this.currentUserImage})
      : super(key: key);

  @override
  _AnimalPostState createState() => _AnimalPostState(
      profileImageLink,
      username,
      date,
      numberOfLoveReacts,
      numberOfComments,
      numberOfShares,
      petName,
      petGenus,
      petGender,
      petAge,
      petImage,
      petVideo,
      currentUserImage);
}

class _AnimalPostState extends State<AnimalPost> {
  String profileImageLink;
  String username;
  String date;
  String numberOfLoveReacts;
  String numberOfComments;
  String numberOfShares;
  String petName;
  String petGenus;
  String petGender;
  String petAge;
  String petImage;
  String petVideo;
  String currentUserImage;

  _AnimalPostState(
      this.profileImageLink,
      this.username,
      this.date,
      this.numberOfLoveReacts,
      this.numberOfComments,
      this.numberOfShares,
      this.petName,
      this.petGenus,
      this.petGender,
      this.petAge,
      this.petImage,
      this.petVideo,
      this.currentUserImage);
  bool _isFollowed = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    late VideoPlayerController _controller;
    late Future<void> _initializeVideoPlayerFuture;
    _controller = VideoPlayerController.network(
      petVideo,
    );
    _initializeVideoPlayerFuture = _controller.initialize();

    return Container(
      width: size.width,
      child: Column(children: [
        SizedBox(
          height: size.width * .04,
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(profileImageLink),
            radius: size.width * .05,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width * .035,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                date,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: size.width * .035,
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
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
            child: Center(
                child: petImage == ''
                    ? FutureBuilder(
                        future: _initializeVideoPlayerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      )
                    : Image.network(
                        petImage,
                        fit: BoxFit.fill,
                      ))),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: size.width * .02),
              child: Text(
                numberOfLoveReacts,
                style:
                    TextStyle(color: Colors.black, fontSize: size.width * .038),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _isFollowed = !_isFollowed;
                });
                print('following: $_isFollowed');
              },
              child: Padding(
                padding: EdgeInsets.all(size.width * .02),
                child: _isFollowed == false
                    ? Icon(
                        FontAwesomeIcons.heart,
                        size: size.width * .06,
                        color: Colors.black,
                      )
                    : Icon(
                        FontAwesomeIcons.solidHeart,
                        size: size.width * .06,
                        color: Colors.red,
                      ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * .04),
              child: Text(
                numberOfComments,
                style:
                    TextStyle(color: Colors.black, fontSize: size.width * .038),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.fromLTRB(size.width * .02, size.width * .02,
                    size.width * .02, size.width * .02),
                child: Icon(
                  FontAwesomeIcons.comment,
                  color: Colors.black,
                  size: size.width * .06,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * .04),
              child: Text(
                numberOfShares,
                style:
                    TextStyle(color: Colors.black, fontSize: size.width * .038),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.fromLTRB(size.width * .02, size.width * .02,
                    size.width * .02, size.width * .02),
                child: Icon(
                  Icons.share,
                  color: Colors.black,
                  size: size.width * .06,
                ),
              ),
            )
          ],
        ),
        Container(
            width: size.width,
            padding: EdgeInsets.fromLTRB(size.width * .02, size.width * .01,
                size.width * .02, size.width * .01),
            child: Column(children: [
              Row(
                children: [
                  Text('Pet name: ',
                      style: TextStyle(
                          color: Colors.black, fontSize: size.width * .038)),
                  Text(petName,
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: size.width * .038)),
                ],
              ),
              Visibility(
                visible: petGenus == '' ? false : true,
                child: Row(
                  children: [
                    Text('Genus: ',
                        style: TextStyle(
                            color: Colors.black, fontSize: size.width * .038)),
                    Text(petGenus,
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: size.width * .038)),
                  ],
                ),
              ),
              Visibility(
                visible: petGender == '' ? false : true,
                child: Row(
                  children: [
                    Text('Gender: ',
                        style: TextStyle(
                            color: Colors.black, fontSize: size.width * .038)),
                    Text(petGender,
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: size.width * .038)),
                  ],
                ),
              ),
              Visibility(
                visible: petAge == '' ? false : true,
                child: Row(
                  children: [
                    Text('Age: ',
                        style: TextStyle(
                            color: Colors.black, fontSize: size.width * .038)),
                    Text(petAge,
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: size.width * .038)),
                  ],
                ),
              )
            ])),
        ListTile(
          title: Text(
            'Add comment...',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          leading: CircleAvatar(
            backgroundImage: currentUserImage == ''
                ? AssetImage('assets/profile_image_demo.png')
                : NetworkImage(currentUserImage) as ImageProvider,
            radius: size.width * .04,
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CommetPage()));
          },
        ),
        Container(
          padding:
              EdgeInsets.fromLTRB(size.width * .02, 0, size.width * .02, 0),
          child: Divider(
            color: Colors.grey.shade300,
            height: size.width * .002,
          ),
        ),
      ]),
    );
  }
}
