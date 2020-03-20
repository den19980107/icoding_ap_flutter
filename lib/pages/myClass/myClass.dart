import 'package:flutter/material.dart';
import 'package:icoding_ap/api/index.dart';
import 'package:icoding_ap/models/Class.dart';
import 'package:icoding_ap/pages/home/classList.dart';
import 'package:icoding_ap/widgets/fullWidthButton.dart';
import 'package:icoding_ap/widgets/share_data_widget.dart';
import 'package:icoding_ap/widgets/text.dart';

class MyClass extends StatefulWidget {
  @override
  _MyClassState createState() => _MyClassState();
}

class _MyClassState extends State<MyClass> {
  Future<List<Class>> _getMyClass() async {
    String userId = ShareDataWidget.of(context).data.userInfo.id;
    var response = await UserRoute().getMyClass(userId);
    var classes = response.data;
    print(classes.length);
    return classes;
  }

  Future<List<Class>> _getMyStudyClass() async {
    String userId = ShareDataWidget.of(context).data.userInfo.id;
    var response = await UserRoute().getMyStudyClass(userId);
    var classes = response.data;
    print(classes.length);
    return classes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的課程"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: TitleText("我開的課"),
          ),
          Container(
            child: ClassList(_getMyClass()),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TitleText("我修的課"),
          ),
          Container(
            child: ClassList(_getMyStudyClass()),
          ),
        ],
      ),
    );
  }
}
