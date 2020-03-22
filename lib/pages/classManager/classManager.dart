import 'package:flutter/material.dart';

class ClassManager extends StatefulWidget {
  @override
  _ClassManagerState createState() => _ClassManagerState();
}

class _ClassManagerState extends State<ClassManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("管理課程"),
      ),
    );
  }
}
