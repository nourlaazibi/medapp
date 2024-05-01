import 'dart:convert';

class Visit {
  String? id;
  DateTime? date;
  String? address;
  String? diagnosis;
  String? recommendation;
  String? userId;
  String? doctorId;

  Visit({
    this.id,
    this.date,
    this.address,
    this.diagnosis,
    this.recommendation,
    this.userId,
    this.doctorId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date?.millisecondsSinceEpoch,
      'address': address,
      'diagnosis': diagnosis,
      'recommendation': recommendation,
      'userId': userId,
      'doctorId': doctorId,
    };
  }

  factory Visit.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Visit();

    return Visit(
      id: map['id'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      address: map['address'],
      diagnosis: map['diagnosis'],
      recommendation: map['recommendation'],
      userId: map['userId'],
      doctorId: map['doctorId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Visit.fromJson(String source) => Visit.fromMap(json.decode(source));
}
