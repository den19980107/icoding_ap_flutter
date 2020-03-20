import 'package:flutter/material.dart';
import 'package:icoding_ap/pages/home/home.dart';
import 'package:icoding_ap/pages/myClass/myClass.dart';
import 'package:icoding_ap/pages/profile/profile.dart';

class BottomNavigator extends StatefulWidget {
  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Text("2"),
    MyClass(),
    Text("4"),
    Profile(),
  ];
  int _selectedIndex = 0;

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首頁'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('搜尋'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('我的課程'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text('通知'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('帳戶'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
