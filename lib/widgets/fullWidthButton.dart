import 'package:flutter/material.dart';
import 'package:icoding_ap/widgets/text.dart';

class FullWidthButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  Color color;
  Color textColor;
  String title;
  FullWidthButton(this.title,
      {this.color, @required this.onPressed, this.textColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        color: color,
        child: SubTitleText(
          "$title",
          color: textColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class FullWidthButtonWithIcon extends StatelessWidget {
  final GestureTapCallback onPressed;
  Color color;
  Color textColor;
  String title;
  Widget icon;
  FullWidthButtonWithIcon(this.title, this.icon,
      {this.color, @required this.onPressed, this.textColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        color: color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: icon,
              margin: EdgeInsets.only(right: 10),
            ),
            SubTitleText(
              "$title",
              color: textColor,
            ),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
