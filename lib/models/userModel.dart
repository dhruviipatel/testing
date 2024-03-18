// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

TodoModel userModelFromJson(String str) => TodoModel.fromJson(json.decode(str));

String userModelToJson(TodoModel data) => json.encode(data.toJson());

class TodoModel {
  int userId;
  int id;
  String title;
  bool completed;

  TodoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
