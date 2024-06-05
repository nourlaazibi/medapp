import 'dart:convert';

class MyNotification{
  String id;
  String title;
  String body;
  String icon;
  DateTime date;

  MyNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.icon,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'icon': icon,
      'date': date.toIso8601String(),
    };
  }

  factory MyNotification.fromMap(Map<String, dynamic> map) {
    return MyNotification(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      body: map['body'] ?? '',
      icon: map['icon'] ?? '',
      date: DateTime.parse(map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MyNotification.fromJson(String source) =>
      MyNotification.fromMap(json.decode(source));
}
