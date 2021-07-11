import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:posts_app/models/users.dart';

class UsersProvider{
  Future<List<Usermodels>> fetchuser() async {
    final String apiUrl = "https://jsonplaceholder.typicode.com/users";
    final response = await http.get(apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => new Usermodels.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}