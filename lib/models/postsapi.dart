import 'dart:convert';

List<Postapimodels> postapimodelsFromJson(String str) => List<Postapimodels>.from(json.decode(str).map((x) => Postapimodels.fromJson(x)));

String postapimodelsToJson(List<Postapimodels> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Postapimodels {
  Postapimodels({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory Postapimodels.fromJson(Map<String, dynamic> json) => Postapimodels(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
