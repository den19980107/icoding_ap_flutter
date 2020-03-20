import 'package:flutter/material.dart';
import 'package:icoding_ap/models/Class.dart';
import 'package:icoding_ap/pages/classDashboard/classDashboard.dart';

class ClassItem extends StatelessWidget {
  Class classData;
  ClassItem(this.classData);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.lightGreen),
        ),
        child: ListTile(
          leading: Container(
            height: 120.0,
            width: 100.0,
            decoration: new BoxDecoration(
              border: Border.all(color: Colors.grey[500], width: 1.0),
              image: DecorationImage(
                image: new NetworkImage(classData.coverImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(classData.name),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ClassDashBoard(classData)));
          },
        ),
      ),
    );
  }
}
