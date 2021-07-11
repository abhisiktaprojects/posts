import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:posts_app/models/commetsmodel.dart';

class CommetsApiProvider{
  Future<List<Commentsmodel>> fetchcommets() async {
    final String apiUrl = "https://jsonplaceholder.typicode.com/posts/1/comments";
    final response = await http.get(apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => new Commentsmodel.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}