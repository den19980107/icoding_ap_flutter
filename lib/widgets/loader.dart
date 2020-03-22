import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          SizedBox(
            child: CircularProgressIndicator(),
            width: 60,
            height: 60,
          ),
        ],
      ),
    );
  }
}
