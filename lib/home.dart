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
  String _appbarTitle = '';

  var _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Transform(
            transform: Matrix4.translationValues(-50.0, 0.0, 0.0),
            child:
                _currentIndex == 0 ? searchBar(context) : appBarTitle(context),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: PageView(
          children: _tabs,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
              if (_currentIndex == 2) {
                _appbarTitle = 'Conversation';
              } else if (_currentIndex == 1) {
                _appbarTitle = 'Favourite';
              } else if (_currentIndex == 3) {
                _appbarTitle = 'Account';
              } else {
                _titleVisibility = true;
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
                } else if (_currentIndex == 0) {
                  _titleVisibility = false;
                } else if (_currentIndex == 1) {
                  _titleVisibility = true;

                  _appbarTitle = 'Favourite';
                } else if (_currentIndex == 3) {
                  _titleVisibility = true;

                  _appbarTitle = 'Account';
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

    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SearchPage()));
      },
      borderRadius: BorderRadius.circular(size.width * .2),
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.width * .2),
            border: Border.all(color: Colors.grey)),
        padding: EdgeInsets.fromLTRB(size.width * .03, size.width * .01,
            size.width * .03, size.width * .01),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.grey, size: size.width * .06),
            SizedBox(
              width: size.width * .04,
            ),
            Text(
              'Search',
              style: TextStyle(color: Colors.grey, fontSize: size.width * .04),
            )
          ],
        ),
      ),
    );
  }

  Widget appBarTitle(BuildContext context) {
    return Visibility(
      visible: _titleVisibility,
      child: Text('$_appbarTitle',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'MateSC',
          )),
    );
  }
}
