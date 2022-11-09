import 'package:flutter/material.dart';

import 'comment_object.dart';

class CommentList extends StatelessWidget {
  List<CommentObject> Comments = [];
  CommentList({Key? key, required this.Comments}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('${Comments.length}'),
            Icon(Icons.message),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: Comments.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                child:
                    Text(Comments[index].email.substring(0, 1).toUpperCase()),
              ),
              title: Text(Comments[index].email),
              subtitle: Text(
                Comments[index].body,
                softWrap: true,
              ),
            ),
          );
        },
      ),
    );
  }
}
