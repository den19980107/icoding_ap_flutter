import 'package:flutter/material.dart';
import 'package:icoding_ap/pages/authenticate/login_page.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}
