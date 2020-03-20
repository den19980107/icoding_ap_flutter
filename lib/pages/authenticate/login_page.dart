import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:icoding_ap/api/auth.dart';
import 'dart:async';
import 'package:icoding_ap/pages/authenticate/register_page.dart';
import 'package:icoding_ap/widgets/defaultAlertDialog.dart';
import 'package:icoding_ap/widgets/fullWidthButton.dart';
import 'package:icoding_ap/widgets/share_data_widget.dart';
import 'package:icoding_ap/widgets/text.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  _handleLogin() async {
    if (_formKey.currentState.validate()) {
      final String username = usernameController.text;
      final String password = passwordController.text;
      var response = await AuthService().login(username, password);
      if (response.isSuccess) {
        ShareDataWidget.of(context).data.setUserInfo(response.data);
      } else {}
    }
  }

  Future<void> _loginWithGoogle() async {
    try {
      var response = await _googleSignIn.signIn();
      print(response);
      var apiResponse =
          await AuthService().loginWithThirdparty("google", response.id);
      if (apiResponse.isSuccess) {
        ShareDataWidget.of(context).data.setUserInfo(apiResponse.data);
      } else {
        showAlertDialog(
            context, Text("錯誤訊息"), Text(apiResponse.errors.messages[0].msg));
      }
    } catch (error) {
      print(error);
    }
  }

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              width: 200,
              child: SvgPicture.asset("assets/svg/Logo.svg",
                  semanticsLabel: 'Acme Logo'),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SubTitleText("帳號"),
                    TextFormField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        hintText: '請輸入密碼',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return '帳號不得為空！';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SubTitleText("密碼"),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: '請輸入密碼',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return '密碼不得為空！';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FullWidthButton(
              "登入",
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () {
                _handleLogin();
              },
            ),
            SizedBox(
              height: 10,
            ),
            FullWidthButton(
              "註冊",
              textColor: Colors.black54,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Register(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            FullWidthButtonWithIcon(
              "使用 Google 帳號登入",
              FaIcon(
                FontAwesomeIcons.google,
                color: Colors.white,
              ),
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () => _loginWithGoogle(),
            ),
          ],
        ),
      ),
    );
  }
}
