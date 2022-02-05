import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

Future<List<Comments>> getCommentsList() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
  if (response.statusCode == 200) {
    List result = jsonDecode(response.body);
    return result.map((job) => Comments.fromJson(job)).toList();
  } else {
    throw Exception('Failed to load comments');
  }
}

class Comments {
  final int postId;
  final int id;
  final String name;
  final String email;

  const Comments(
      {required this.postId,
      required this.id,
      required this.name,
      required this.email});

  factory Comments.fromJson(Map<String, dynamic> json) {
    return Comments(
        postId: json['postId'],
        id: json['id'],
        name: json['name'],
        email: json['email']);
  }
}
