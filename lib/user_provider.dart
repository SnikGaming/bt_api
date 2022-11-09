import 'dart:convert';
import 'user_object.dart';
import 'package:http/http.dart' as http;

class UserProvider{
  //Parse file json sang danh sách đối tượng
  static List<UserObject> parseUsers(String reponseBody){
    final parsed = jsonDecode(reponseBody).cast<Map<String, dynamic>>();
    return parsed.map<UserObject>((e) => UserObject.fromJson(e)).toList();
  }

  static Future<List<UserObject>> fecthUsers() async{
    final response = await http.get(Uri.parse('http://jsonplaceholder.typicode.com/users/'));
    return parseUsers(response.body);
  }

  static Future<UserObject> fecthUsersById(int id) async{
    final response = await http.get(Uri.parse('http://jsonplaceholder.typicode.com/users/$id'));
    return UserObject.fromJson(jsonDecode(response.body));
  }

}