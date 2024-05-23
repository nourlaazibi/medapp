import 'dart:convert';

class WorkingDay {
  String id;
  String? name;
  List<String>? hours;

  WorkingDay({
    required this.id,
    this.name,
    this.hours,
  });

  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'name': name,
      'hours': hours,
    };
  }

  factory WorkingDay.fromMap(Map<String, dynamic>? map) {
    if (map == null) return WorkingDay(id: '');

    return WorkingDay(
      id: map['id'],
      name: map['name'],
      hours: List<String>.from(map['hours']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkingDay.fromJson(String source) =>
      WorkingDay.fromMap(json.decode(source));
}
