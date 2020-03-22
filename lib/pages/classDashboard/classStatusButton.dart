import 'package:flutter/material.dart';
import 'package:icoding_ap/api/index.dart';
import 'package:icoding_ap/models/StudentTakeCourse.dart';
import 'package:icoding_ap/pages/classManager/classManager.dart';
import 'package:icoding_ap/pages/materialManager/MaterialManager.dart';
import 'package:icoding_ap/widgets/fullWidthButton.dart';
import 'package:icoding_ap/widgets/loader.dart';
import 'package:icoding_ap/widgets/share_data_widget.dart';

class ClassStatusButton extends StatefulWidget {
  final String teacherId;
  final String classId;
  ClassStatusButton(this.classId, this.teacherId);

  @override
  _ClassStatusButtonState createState() => _ClassStatusButtonState();
}

class _ClassStatusButtonState extends State<ClassStatusButton> {
  Future<StudentTakeCourse> _getStudentStatus() async {
    var response = await ClassRoute().getStudentStatuseList(widget.classId);
    if (response.isSuccess) {
      var studentsStatus = response.data;
      for (var studentStatus in studentsStatus) {
        if (studentStatus.studentId ==
            ShareDataWidget.of(context).data.userInfo.id) {
          return studentStatus;
        }
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Widget returnWidget = Loader();

    if (widget.teacherId != ShareDataWidget.of(context).data.userInfo.id) {
      returnWidget = FutureBuilder(
        future: _getStudentStatus(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return _StudentNotInButtons();
          } else if (snapshot.hasData) {
            var studentStatus = snapshot as StudentTakeCourse;
            switch (studentStatus.status) {
              case StudentTakeCourseStatus.alreadyIn:
                return _StudentInButtons();
                break;
              case StudentTakeCourseStatus.inProgress:
                return _StudentOnReviewButtons();
                break;
              case StudentTakeCourseStatus.notTake:
              case StudentTakeCourseStatus.quit:
                return _StudentNotInButtons();
                break;
              default:
                return _StudentNotInButtons();
            }
          } else if (snapshot.error != null) {
            return Text("取得資料錯誤！");
          } else {
            return Loader();
          }
        },
      );
    } else {
      returnWidget = _TeacherButton();
    }
    return returnWidget;
  }
}

class _TeacherButton extends StatelessWidget {
  _navigateToClassManager(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ClassManager(),
      ),
    );
  }

  _navigateToMaterialManager(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MaterialManager(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          FullWidthButton(
            "管理教材",
            onPressed: () => _navigateToMaterialManager(context),
          ),
          SizedBox(
            height: 10,
          ),
          FullWidthButton(
            "管理課程",
            onPressed: () => _navigateToClassManager(context),
          )
        ],
      ),
    );
  }
}

class _StudentNotInButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          FullWidthButton(
            "我要上課",
            onPressed: () {},
          ),
          SizedBox(
            height: 10,
          ),
          FullWidthButton(
            "收藏",
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

class _StudentInButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          FullWidthButton(
            "查看教材",
            onPressed: () {},
          ),
          SizedBox(
            height: 10,
          ),
          FullWidthButton(
            "退選課程",
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

class _StudentOnReviewButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          FullWidthButton(
            "取消申請",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
