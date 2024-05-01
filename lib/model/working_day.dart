import 'dart:convert';

class WorkingDay {
  String? name;
  List<String>? hours;

  WorkingDay({
    this.name,
    this.hours,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'hours': hours,
    };
  }

  factory WorkingDay.fromMap(Map<String, dynamic>? map) {
    if (map == null) return WorkingDay();

    return WorkingDay(
      name: map['name'],
      hours: List<String>.from(map['hours']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkingDay.fromJson(String source) =>
      WorkingDay.fromMap(json.decode(source));
}
