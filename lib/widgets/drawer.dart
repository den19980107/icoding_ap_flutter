import 'package:flutter/material.dart';
import 'package:icoding_ap/widgets/share_data_widget.dart';
import 'package:icoding_ap/widgets/text.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ShareDataWidget.of(context).data.userInfo.avatarsUrl != null
                    ? CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            ShareDataWidget.of(context)
                                .data
                                .userInfo
                                .avatarsUrl),
                      )
                    : CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            "https://api.adorable.io/avatars/285/test"),
                      ),
                SizedBox(
                  height: 10,
                ),
                TitleText(
                  ShareDataWidget.of(context).data.userInfo.displayName,
                  color: Colors.white,
                ),
                SubTitleText(
                  ShareDataWidget.of(context).data.userInfo.email,
                  color: Colors.white,
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(IconData(0xe8ac, fontFamily: 'MaterialIcons')),
              ],
            ),
            title: PlanText(
              "登出",
              color: Colors.grey,
            ),
            onTap: () {
              ShareDataWidget.of(context).data.setUserInfo(null);
            },
          )
        ],
      ),
    );
  }
}
