class PostObject{
  final int id;
  final int userId;
  final String title;
  final String body;
  PostObject(this.id, this.userId, this.title, this.body);
  PostObject.fromJson(Map<String, dynamic> r)
    : id = r['id'],
      userId = r['userId'],
      title = r['title'],
      body = r['body'];
}