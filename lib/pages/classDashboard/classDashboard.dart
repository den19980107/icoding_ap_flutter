import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:icoding_ap/models/Class.dart';
import 'package:icoding_ap/pages/classDashboard/classStatusButton.dart';
import 'package:html/dom.dart' as dom;
import 'package:icoding_ap/widgets/videoPlayer.dart';

class ClassDashBoard extends StatefulWidget {
  final Class classInfo;
  ClassDashBoard(this.classInfo);
  @override
  _ClassDashBoardState createState() => _ClassDashBoardState();
}

class _ClassDashBoardState extends State<ClassDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.classInfo.name}"),
      ),
      body: ListView(
        children: <Widget>[
          VideoPlayer(
            aspectRatioX: 16,
            aspectRatioY: 9,
            videoUrl: widget.classInfo.introVideoUrl,
          ),
          ClassStatusButton(widget.classInfo.id, widget.classInfo.teacherId),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Html(
              customTextStyle: (dom.Node node, TextStyle baseStyle) {
                if (node is dom.Element) {
                  switch (node.localName) {
                    case "p":
                      return baseStyle
                          .merge(TextStyle(height: 2, fontSize: 20));
                  }
                }
                return baseStyle;
              },
              data: widget.classInfo.introduction,
            ),
          ),
        ],
      ),
    );
  }
}
