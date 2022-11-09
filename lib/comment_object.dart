class CommentObject{
  final int id;
  final int postId;
  final String email;
  final String body;
  CommentObject(this.id, this.postId, this.email, this.body);
  CommentObject.fromJson(Map<String, dynamic> r)
    : id = r['id'],
      postId = r['postId'],
      email = r['email'],
      body = r['body'];
}