import 'dart:convert';
import 'comment_object.dart';
import 'package:http/http.dart' as http;

class CommentProvider{
  //chuyển chuỗi json sang danh sách đối tượng
  static List<CommentObject> parseComments(String source){
    final parsed = jsonDecode(source).cast<Map<String, dynamic>>();
    List<CommentObject> ls = parsed.map<CommentObject>((e) => CommentObject.fromJson(e)).toList();
    return ls;
  }

  static Future<List<CommentObject>> fecthCommentByPost(int postID) async{
    final response = await http.get(Uri.parse('http://jsonplaceholder.typicode.com/posts/$postID/comments'));
    return parseComments(response.body);
  }

}