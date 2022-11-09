import 'dart:convert';
import 'post_object.dart';
import 'package:http/http.dart' as http;

class PostProvider{
  //chuyển chuỗi json sang danh sách đối tượng
  static List<PostObject> parsePosts(String reponseBody){
    final parsed = jsonDecode(reponseBody).cast<Map<String, dynamic>>();
    return parsed.map<PostObject>((e) => PostObject.fromJson(e)).toList();
  }

  static Future<List<PostObject>> fecthPosts() async{
    final response = await http.get(Uri.parse('http://jsonplaceholder.typicode.com/posts'));
    return parsePosts(response.body);
  }

}