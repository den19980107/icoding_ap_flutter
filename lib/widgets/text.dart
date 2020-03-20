import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  Color color = Colors.black;
  TitleText(this.text, {this.color});
  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(fontSize: 24, color: color),
    );
  }
}

class SubTitleText extends StatelessWidget {
  final String text;
  Color color = Colors.black;
  SubTitleText(this.text, {this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(fontSize: 20, color: color),
    );
  }
}

class PlanText extends StatelessWidget {
  final String text;
  Color color = Colors.black;
  PlanText(this.text, {this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(fontSize: 16, color: color),
    );
  }
}
