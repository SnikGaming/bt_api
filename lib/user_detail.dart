import 'package:bt_api/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'user_object.dart';

class UserDetail extends StatelessWidget {
  int userid;
  UserDetail({Key? key, required this.userid}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserObject>(
      future: UserProvider.fecthUsersById(userid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserObject user = snapshot.data!;
          return Scaffold(
              appBar: AppBar(
                title: Row(
                  children: [
                    Expanded(
                      child: Text('Thông tin người dùng'),
                    ),
                  ],
                ),
              ),
              body: Container(
                margin: EdgeInsets.only(top: 10, left: 10),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        radius: 55,
                        child:
                            Text(user.username.substring(0, 1).toUpperCase()),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          '${user.name} (${user.username})',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          'Email: ${user.email})',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        }
        return Scaffold(
          body: Center(
            child: Text('Ứng Dụng Đang Tải Dữ Liệu'),
          ),
        );
      },
    );
  }
}

/*
ListTile(
            leading: CircleAvatar(
              child: Text(user.username.substring(0, 1).toUpperCase()),
            ),
            title: Text(user.username),
            subtitle: Text(user.email),
          );


Column(
            children: [
              CircleAvatar(
                child: Text(user.username.substring(0, 1).toUpperCase()),
              ),
            ],
          );
*/

/*
Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Tìm Kiếm',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
                onChanged: (value){
                  _LoadDanhSach(value);
                },
                controller: search,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: ListView.builder(
          itemCount: lsContacts.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(lsContacts[index].picture),
              ),
              title: Text(lsContacts[index].name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(lsContacts[index].phone),
                  Text(lsContacts[index].email),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                      ContactDetail(contact: lsContacts[index]),
                  )
                );
              },
            ),
          ),
        ),
      ),
    );
*/