import 'package:flutter/material.dart';
import 'package:icoding_ap/api/auth.dart';
import 'package:icoding_ap/widgets/defaultAlertDialog.dart';
import 'package:icoding_ap/widgets/fullWidthButton.dart';
import 'package:icoding_ap/widgets/text.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final displayNameController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final password2Controller = TextEditingController();

  _handleRegister() async {
    if (_formKey.currentState.validate()) {
      final String displayName = displayNameController.text;
      final String email = emailController.text;
      final String username = usernameController.text;
      final String password = passwordController.text;
      final String password2 = password2Controller.text;

      var response = await AuthService()
          .register(displayName, email, username, password, password2);

      if (response.isSuccess) {
        Navigator.pop(context);
      } else {
        String errorMessages = "";
        for (var error in response.errors.messages) {
          errorMessages += "${error.msg} \n";
        }

        var title = Text("錯誤訊息");
        var content = Text(errorMessages);

        showAlertDialog(context, title, content);
      }
    }
  }

  String _validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return '請輸入正確的 email 格式！';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("註冊"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SubTitleText("姓名"),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: displayNameController,
                    decoration: const InputDecoration(
                      hintText: '請輸入姓名',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return '姓名不得為空！';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SubTitleText("信箱"),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: '請輸入信箱',
                    ),
                    validator: _validateEmail,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SubTitleText("帳號"),
                  TextFormField(
                    keyboardType: TextInputType.text,
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
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    controller: passwordController,
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
                  SizedBox(
                    height: 10,
                  ),
                  SubTitleText("確認密碼"),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    controller: password2Controller,
                    decoration: const InputDecoration(
                      hintText: '請再輸入一次密碼',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return '確認密碼不得為空！';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          FullWidthButton(
            "註冊",
            color: Colors.green,
            textColor: Colors.white,
            onPressed: () => _handleRegister(),
          ),
        ],
      ),
    );
  }
}
