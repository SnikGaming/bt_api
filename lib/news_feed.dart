import 'package:flutter/material.dart';

import 'author_post.dart';
import 'comment_post.dart';
import 'post_object.dart';
import 'post_provider.dart';

class NewsFeed extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewsFeedState();
  }
}

class NewsFeedState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        child: FutureBuilder<List<PostObject>>(
          future: PostProvider.fecthPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<PostObject> lsPost = snapshot.data!;
              return ListView.builder(
                itemCount: lsPost.length,
                itemBuilder: (context, index) => Card(
                  child: Column(
                    children: [
                      AuthorPost(userid: lsPost[index].userId),
                      Container(
                        padding: EdgeInsets.all(5),
                        width: double.infinity,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Nội dung bài viết',
                            softWrap: true,
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      CommentPost(postid: lsPost[index].id),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Hệ thống đang có sự cố'),
              );
            }
            return CircularProgressIndicator();
          },
        ));
  }
}

