import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_lover/navigation_bar_screens/account_nav.dart';
import 'package:pet_lover/navigation_bar_screens/chat_nav.dart';
import 'package:pet_lover/navigation_bar_screens/following_nav.dart';
import 'package:pet_lover/navigation_bar_screens/home_nav.dart';
import 'package:pet_lover/sub_screens/search.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final _tabs = [
    HomeNav(),
    FollowingNav(),
    ChatNav(),
    AccountNav(),
  ];

  bool _titleVisibility = true;
  bool _profileImageVisibility = false;
  String _appbarTitle = 'Pet Lover';

  var _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        //backgroundColor: Colors.white,
        appBar: PreferredSize(
          child: _currentIndex == 0 ? searchBar(context) : appBarTitle(context),
          preferredSize: Size.fromHeight(60),
        ),
        body: PageView(
          children: _tabs,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
              if (_currentIndex == 2) {
                _appbarTitle = 'Conversation';
                _profileImageVisibility = true;
              } else {
                _titleVisibility = true;
                _profileImageVisibility = false;
                _appbarTitle = 'Pet Lover';
              }
            });
          },
          controller: _pageController,
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
              primaryColor: Colors.deepOrange,
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.grey))),
          child: new BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            items: [
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.home), label: 'Home'),
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.favorite_sharp), label: 'Favourite'),
              BottomNavigationBarItem(
                  icon: new Icon(FontAwesomeIcons.solidComment), label: 'Chat'),
              BottomNavigationBarItem(
                  icon: new Icon(Icons.person), label: 'Account'),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                if (_currentIndex == 2) {
                  _appbarTitle = 'Conversation';
                  _profileImageVisibility = true;
                } else if (_currentIndex == 0) {
                  _titleVisibility = false;
                } else {
                  _titleVisibility = true;
                  _profileImageVisibility = false;
                  _appbarTitle = 'Pet Lover';
                }
                _pageController.animateToPage(_currentIndex,
                    duration: Duration(milliseconds: 100),
                    curve: Curves.linear);
              });
            },
          ),
        ),
      ),
    );
  }

  Widget searchBar(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.fromLTRB(size.width * .03, size.width * .02,
          size.width * .03, size.width * .02),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchPage()));
        },
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
            padding: EdgeInsets.fromLTRB(size.width * .03, size.width * .02,
                size.width * .03, size.width * .02),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.grey, size: size.width * .06),
                SizedBox(
                  width: size.width * .03,
                ),
                Text(
                  'Search',
                  style:
                      TextStyle(color: Colors.grey, fontSize: size.width * .04),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appBarTitle(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(size.width * .03, size.width * .03,
          size.width * .03, size.width * .03),
      child: Row(
        children: [
          Visibility(
            visible: _profileImageVisibility,
            child: CircleAvatar(
              backgroundImage: AssetImage(
                'assets/profile_image.jpg',
              ),
            ),
          ),
          SizedBox(
            width: size.width * .02,
          ),
          Visibility(
            visible: _titleVisibility,
            child: Text('$_appbarTitle',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'MateSC',
                    fontSize: size.width * .038)),
          ),
        ],
      ),
    );
  }
}
