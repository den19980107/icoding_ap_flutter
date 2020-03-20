import 'dart:convert';

class UserInfo {
  String id;
  String displayName;
  String username;
  String email;
  String accountType;
  String accountId;
  String avatarsUrl;
  String profile;

  UserInfo({
    this.id,
    this.displayName,
    this.username,
    this.email,
    this.accountType,
    this.accountId,
    this.avatarsUrl,
    this.profile,
  });

  factory UserInfo.fromRawJson(String str) =>
      UserInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserInfo.fromJson(Map<String, dynamic> json) => new UserInfo(
        id: json["_id"],
        displayName: json["displayName"],
        username: json["username"],
        email: json["email"],
        accountType: json["accountType"],
        accountId: json["accountId"],
        avatarsUrl: json["avatarsUrl"],
        profile: json["profile"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "displayName": displayName,
        "username": username,
        "email": email,
        "accountType": accountType,
        "accountId": accountId,
        "avatarsUrl": avatarsUrl,
        "profile": profile,
      };
}
