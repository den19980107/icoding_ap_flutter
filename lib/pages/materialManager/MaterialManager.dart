import 'package:flutter/material.dart';

class MaterialManager extends StatefulWidget {
  @override
  _MaterialManagerState createState() => _MaterialManagerState();
}

class _MaterialManagerState extends State<MaterialManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("管理教材"),
      ),
    );
  }
}
