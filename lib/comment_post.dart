import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'comment_object.dart';
import 'comment_provider.dart';
import 'comments_screen.dart';

class CommentPost extends StatelessWidget {
  int postid;
  CommentPost({Key? key, required this.postid}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CommentObject>>(
      future: CommentProvider.fecthCommentByPost(postid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<CommentObject> lsComments = snapshot.data!;
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('${lsComments.length}'),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CommentList(
                                Comments: lsComments,
                              )));
                },
                child: Text('Comments', style: TextStyle(color: Colors.white)),
              ),
            ],
          );
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('0 '),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Comments',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        );
      },
    );
  }
}
