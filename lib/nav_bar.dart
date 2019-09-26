import 'package:flutter/material.dart';
import 'pages/home_screen.dart';
import 'pages/email_screen.dart';
import 'pages/pages_screen.dart';
import 'pages/people_screen.dart';

class BottomBar extends StatefulWidget {
  // name({Key key}) : super(key: key);

  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final bottomBarColor = Colors.purple;

  int _currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState() {
    list
      ..add(HomeScreen())
      ..add(EmailScreen())
      ..add(PagesScreen())
      ..add(PeopleScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: bottomBarColor,
                ),
                title: Text('首页', style: TextStyle(color: bottomBarColor))),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.email,
                  color: bottomBarColor,
                ),
                title: Text('邮件', style: TextStyle(color: bottomBarColor))),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.pages,
                  color: bottomBarColor,
                ),
                title: Text('页面', style: TextStyle(color: bottomBarColor))),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: bottomBarColor,
                ),
                title: Text('我的', style: TextStyle(color: bottomBarColor))),
          ],
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed),
    );
  }
}
