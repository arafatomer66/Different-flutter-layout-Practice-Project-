// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

OverViewModel welcomeFromJson(String str) =>
    OverViewModel.fromJson(json.decode(str));

String welcomeToJson(OverViewModel data) => json.encode(data.toJson());

class OverViewModel {
  OverViewModel({
    this.status,
    this.data,
    this.total,
  });

  String status;
  Data data;
  int total;

  factory OverViewModel.fromJson( json) => OverViewModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "total": total,
      };
}

class Data {
  Data({
    this.tasks,
  });

  List<Task> tasks;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        tasks: List<Task>.from(json["tasks"].map((x) => Task.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tasks": List<dynamic>.from(tasks.map((x) => x.toJson())),
      };
}

class Task {
  Task({
    this.id,
    this.counting,
  });

  String id;
  int counting;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["_id"],
        counting: json["counting"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "counting": counting,
      };
}
