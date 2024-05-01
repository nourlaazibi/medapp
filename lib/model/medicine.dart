import 'dart:convert';

class Medicine {
  String? id;
  String? name;
  String? category;
  int? daysOfTreat;
  int? pillsPerDay;

  Medicine({
    this.id,
    this.name,
    this.category,
    this.daysOfTreat,
    this.pillsPerDay,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'daysOfTreat': daysOfTreat,
      'pillsPerDay': pillsPerDay,
    };
  }

  factory Medicine.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Medicine();

    return Medicine(
      id: map['id'],
      name: map['name'],
      category: map['category'],
      daysOfTreat: map['daysOfTreat'],
      pillsPerDay: map['pillsPerDay'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Medicine.fromJson(String source) =>
      Medicine.fromMap(json.decode(source));
}
