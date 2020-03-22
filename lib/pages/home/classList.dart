import 'package:flutter/material.dart';
import 'package:icoding_ap/models/Class.dart';
import 'package:icoding_ap/pages/home/classItem.dart';

class ClassList extends StatefulWidget {
  final Future<List<Class>> classes;
  ClassList(this.classes);
  @override
  _ClassListState createState() => _ClassListState();
}

class _ClassListState extends State<ClassList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: FutureBuilder(
          future: widget.classes,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ClassItem(snapshot.data[index]);
                },
              );
            } else if (snapshot.error != null) {
              return Text("取得資料錯誤！");
            } else {
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
          },
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:icoding_ap/api/index.dart';
// import 'package:icoding_ap/models/Class.dart';
// import 'package:icoding_ap/pages/home/classItem.dart';

// class ClassList extends StatefulWidget {
//   @override
//   _ClassListState createState() => _ClassListState();
// }

// class _ClassListState extends State<ClassList> {
//   Future<List<Class>> _getClasses() async {
//     var response = await ClassRoute().getAllClasses();
//     if (response.isSuccess) {
//       return response.data;
//     } else {
//       return null;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         child: FutureBuilder(
//           future: _getClasses(),
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                 itemCount: snapshot.data.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return ClassItem(snapshot.data[index]);
//                 },
//               );
//             } else if (snapshot.error != null) {
//               return Text("取得資料錯誤！");
//             } else {
//               return Center(
//                 child: Column(
//                   children: <Widget>[
//                     SizedBox(
//                       height: 20,
//                     ),
//                     SizedBox(
//                       child: CircularProgressIndicator(),
//                       width: 60,
//                       height: 60,
//                     ),
//                   ],
//                 ),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
