import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'user_detail.dart';
import 'user_object.dart';
import 'user_provider.dart';

class AuthorPost extends StatelessWidget {
  int userid;
  AuthorPost({Key? key, required this.userid}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserObject>(
      future: UserProvider.fecthUsersById(userid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserObject user = snapshot.data!;
          return ListTile(
            leading: CircleAvatar(
              child: Text(user.username.substring(0, 1).toUpperCase()),
            ),
            title: InkWell(
              child: Text(user.username),
              onTap: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserDetail(userid: userid)));
              }),
            ),
            subtitle: Text(user.email),
          );
        }
        return Text('Ứng Dụng Đang Tải Dữ Liệu');
      },
    );
  }
}
