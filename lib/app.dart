import 'package:flutter/material.dart';
import 'package:icoding_ap/models/User.dart';
import 'package:icoding_ap/bottomNavigator.dart';
import 'package:icoding_ap/pages/authenticate/authenticate.dart';

import 'package:icoding_ap/widgets/share_data_widget.dart';

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'icoding',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Wrapper(title: 'icoding Home Page'),
    );
  }
}

class Wrapper extends StatefulWidget {
  Wrapper({Key key, this.title}) : super(key: key);

  final String title;

  @override
  WrapperState createState() => WrapperState();
}

class WrapperState extends State<Wrapper> {
  UserInfo userInfo;

  setUserInfo(UserInfo user) {
    setState(() {
      userInfo = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget renderWidget = new Container();
    if (userInfo == null) {
      renderWidget = Authenticate();
    } else {
      renderWidget = BottomNavigator();
    }
    return ShareDataWidget(
      data: this,
      child: renderWidget,
    );
  }
}
