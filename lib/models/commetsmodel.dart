// To parse this JSON data, do
//
//     final commentsmodel = commentsmodelFromJson(jsonString);

import 'dart:convert';

List<Commentsmodel> commentsmodelFromJson(String str) => List<Commentsmodel>.from(json.decode(str).map((x) => Commentsmodel.fromJson(x)));

String commentsmodelToJson(List<Commentsmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Commentsmodel {
  Commentsmodel({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  int postId;
  int id;
  String name;
  String email;
  String body;

  factory Commentsmodel.fromJson(Map<String, dynamic> json) => Commentsmodel(
    postId: json["postId"],
    id: json["id"],
    name: json["name"],
    email: json["email"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "postId": postId,
    "id": id,
    "name": name,
    "email": email,
    "body": body,
  };
}
