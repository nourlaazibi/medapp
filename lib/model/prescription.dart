import 'dart:convert';

import 'doctor.dart';

class Prescription {
  String? id;
  String? name;
  DateTime? date;
  String? userId;
  String? doctorId;
  Doctor? doctor;

  Prescription({
    this.id,
    this.name,
    this.date,
    this.userId,
    this.doctorId,
    this.doctor,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'date': date?.millisecondsSinceEpoch,
      'userId': userId,
      'doctorId': doctorId,
      'doctor': doctor?.toMap(),
    };
  }

  factory Prescription.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Prescription();

    return Prescription(
      id: map['id'],
      name: map['name'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      userId: map['userId'],
      doctorId: map['doctorId'],
      doctor: Doctor.fromMap(map['doctor']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Prescription.fromJson(String source) =>
      Prescription.fromMap(json.decode(source));
}
