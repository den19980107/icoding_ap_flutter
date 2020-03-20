import 'package:flutter/material.dart';
import 'package:icoding_ap/widgets/share_data_widget.dart';
import 'package:icoding_ap/widgets/text.dart';

class UserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ShareDataWidget.of(context).data.userInfo.avatarsUrl != null
              ? CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      ShareDataWidget.of(context).data.userInfo.avatarsUrl),
                )
              : Icon(
                  Icons.account_circle,
                  size: 100,
                  color: Colors.grey,
                ),
          TitleText("曾柏翰"),
          SubTitleText("高科大"),
          SubTitleText("電腦與通訊工程系 大四"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.green[200],
              onPressed: () => {},
              child: Text(
                '管理個人檔案',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
