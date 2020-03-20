import 'package:flutter/material.dart';

showAlertDialog(BuildContext context, Widget title, Widget content,
    {List<Widget> actions}) {
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: title,
    content: content,
    actions: actions,
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
