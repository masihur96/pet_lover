import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_lover/navigation_bar_screens/account_nav.dart';
import 'package:pet_lover/navigation_bar_screens/chat_nav.dart';
import 'package:pet_lover/navigation_bar_screens/following_nav.dart';
import 'package:pet_lover/navigation_bar_screens/home_nav.dart';

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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: false,
        title: Transform(
            transform: Matrix4.translationValues(-50, 0, 0),
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
                      )),
                ),
              ],
            )),
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
              } else {
                _titleVisibility = true;
                _profileImageVisibility = false;
                _appbarTitle = 'Pet Lover';
              }
              _pageController.animateToPage(_currentIndex,
                  duration: Duration(milliseconds: 100), curve: Curves.linear);
            });
          },
        ),
      ),
    );
  }
}
