import 'package:flutter/material.dart';
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

  var _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: false,
        title: Transform(
          transform: Matrix4.translationValues(-50, 0, 0),
            child: Text(
            'Pet Lover',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'MateSC',
            )
          ),
        ),
      ),
      body: PageView(
        children: _tabs,
        onPageChanged: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        controller: _pageController,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
            primaryColor: Colors.deepOrange,
            textTheme: Theme
                .of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.grey))),
        child: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          items: [
            new BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: 'Home'
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.people),
              label: 'Following'
            ),
            BottomNavigationBarItem(
                icon: new Icon(Icons.chat_rounded),
                label: 'Chat'
            ),
            BottomNavigationBarItem(
                icon: new Icon(Icons.person),
                label: 'Account'
            ),
          ],
          onTap: (index){
            setState(() {
              _currentIndex = index;
              _pageController.animateToPage(_currentIndex, duration: Duration(milliseconds:200), curve: Curves.linear);
            });
          },
        ),
      ),
    );
  }
}

