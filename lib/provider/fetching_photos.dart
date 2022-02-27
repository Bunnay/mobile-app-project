import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

Future<List<Photos>> getPhotosList() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  if (response.statusCode == 200) {
    List result = jsonDecode(response.body);
    return result.map((job) => Photos.fromJson(job)).toList();
  } else {
    throw Exception('Failed to load comments');
  }
}

class Photos {
  // final int postId;
  final int id;
  final String title;
  final String url;

  const Photos(
      {
        // required this.postId,
      required this.id,
      required this.title,
      required this.url});

  factory Photos.fromJson(Map<String, dynamic> json) {
    return Photos(
        // postId: json['postId'],
        id: json['id'],
        title: json['title'],
        url: json['url']);
  }
}
