import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_lover/sub_screens/commentSection.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: _bodyUI(context)),
    );
  }

  Widget _bodyUI(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            SizedBox(
              height: size.width * .04,
            ),
            Container(
              width: size.width,
              child: Row(
                children: [
                  Container(
                      width: size.width * .84, child: _searchBar(context)),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _searchController.text = '';
                      });
                    },
                    borderRadius: BorderRadius.circular(size.width * .02),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(size.width * .01,
                          size.width * .02, size.width * .01, size.width * .02),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: size.width * .04,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.width * .02,
            ),
            _posts(context),
          ],
        ));
  }

  Widget _searchBar(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.fromLTRB(size.width * .03, size.width * .01,
          size.width * .03, size.width * .01),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(size.width * .2),
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.width * .2),
              border: Border.all(color: Colors.grey)
              // boxShadow: [
              //   BoxShadow(color: Colors.grey, spreadRadius: 1),
              // ],
              ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(size.width * .03, size.width * .001,
                size.width * .03, size.width * .001),
            child: _textFormBuilder('Search'),
          ),
        ),
      ),
    );
  }

  Widget _textFormBuilder(String hint) {
    return TextFormField(
      controller: _searchController,
      validator: (value) {
        if (value!.isEmpty)
          return 'Enter $hint';
        else
          return null;
      },
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black,
        ),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
      ),
      cursorColor: Colors.black,
    );
  }

  Widget _posts(BuildContext context) {
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
          onTap: () {
            setState(() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CommetPage()));
            });
          },
        ),
        SizedBox(
          height: size.width * .02,
        )
      ]),
    );
  }

  Widget _cancelSearch(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.fromLTRB(size.width * .01, size.width * .02,
          size.width * .01, size.width * .02),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchPage()));
        },
        borderRadius: BorderRadius.circular(size.width * .2),
        child: Container(
          // width: size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.width * .2),
              border: Border.all(color: Colors.grey)
              // boxShadow: [
              //   BoxShadow(color: Colors.grey, spreadRadius: 1),
              // ],
              ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(size.width * .03, size.width * .02,
                size.width * .03, size.width * .02),
            child: Text(
              'Cancel',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: size.width * .04),
            ),
          ),
        ),
      ),
    );
  }
}
