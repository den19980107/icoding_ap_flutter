import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:icoding_ap/models/Class.dart';
import 'package:icoding_ap/widgets/fullWidthButton.dart';
import 'package:html/dom.dart' as dom;

class ClassDashBoard extends StatefulWidget {
  Class classInfo;
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
          // VideoPlayerScreen(),
          Container(
            height: 200,
            color: Colors.grey,
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              FullWidthButton(
                "我要上課",
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {},
              ),
              SizedBox(
                height: 10,
              ),
              FullWidthButton(
                "收藏",
                textColor: Colors.black54,
                onPressed: () {},
              ),
            ],
          ),
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
