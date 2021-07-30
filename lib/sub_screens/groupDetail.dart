import 'package:flutter/material.dart';

class GroupDetail extends StatefulWidget {
  const GroupDetail({Key? key}) : super(key: key);

  @override
  _GroupDetailState createState() => _GroupDetailState();
}

class _GroupDetailState extends State<GroupDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _bodyUI(context),
    );
  }

  Widget _bodyUI(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * .35,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/dog.jpg'), fit: BoxFit.fill)),
              child: Stack(
                children: [
                  Positioned(
                    top: size.width * .04,
                    left: size.width * .04,
                    child: InkWell(
                      onTap: () {},
                      radius: 10,
                      child: Container(
                        width: size.width * .1,
                        height: size.width * .1,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[500],
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: size.width * .04,
                    right: size.width * .04,
                    child: InkWell(
                      onTap: () {},
                      radius: 10,
                      child: Container(
                        width: size.width * .1,
                        height: size.width * .1,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[500],
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * .04,
                  top: size.width * .02,
                  bottom: size.width * .02),
              child: Text(
                'Group name',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * .06),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * .04, right: size.width * .04),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.security, size: size.width * .042),
                  SizedBox(width: size.width * .01),
                  Text(
                    'Public',
                    style: TextStyle(
                        color: Colors.black, fontSize: size.width * .04),
                  ),
                  SizedBox(width: size.width * .05),
                  Icon(Icons.group, size: size.width * .042),
                  SizedBox(width: size.width * .01),
                  Text(
                    '1',
                    style: TextStyle(
                        color: Colors.black, fontSize: size.width * .04),
                  ),
                  Text(
                    ' Members',
                    style: TextStyle(
                        color: Colors.black, fontSize: size.width * .04),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
