import 'package:flutter/material.dart';
import 'barpages/MainPage.dart';
import 'barpages/QuizPage.dart';
import 'barpages/SettingsPage.dart';
import 'barpages/BookmarkPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _children = [
    const MainPage(),
    const BookmarkPage(),
    const QuizPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _children.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xff6442ED),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _navigateBottomBar,
        items: const [
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'home'),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.bookmark),
              icon: Icon(Icons.bookmark_border_outlined),
              label: 'bookmarks'),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.quiz),
              icon: Icon(Icons.quiz_outlined),
              label: 'quiz'),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.settings),
              icon: Icon(Icons.settings_outlined),
              label: 'settings')
        ],
      ),
    );
  }
}
