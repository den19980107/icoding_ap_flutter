import 'package:flutter/material.dart';
import 'package:icoding_ap/pages/profile/userCard.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          UserCard(),
        ],
      ),
    );
  }
}
