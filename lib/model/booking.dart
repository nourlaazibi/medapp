import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Booking {
  final String id;
  final String doctorId;
  final String userId;
  final Timestamp date;
  String patient;
  String? mobile;
  String? patientMobile;
  String? email;
  int? healthConcern;

  Booking({
    required this.id,
    required this.doctorId,
    required this.userId,
    required this.date,
    required this.patient,
    this.mobile,
    this.patientMobile,
    this.email,
    this.healthConcern,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'doctorId': doctorId,
      'userId': userId,
      'date': date.toDate().toString(),
      'patient': patient,
      'mobile': mobile,
      'patientMobile': patientMobile,
      'email': email,
      'healthConcern': healthConcern,
    };
  }

  factory Booking.fromMap(Map<String, dynamic>? map) {
    if (map == null) throw ArgumentError("Null map was passed");

    return Booking(
      id: map['id'],
      doctorId: map['doctorId'],
      userId: map['userId'],
      date: map['date'],
      patient: map['patient'],
      mobile: map['mobile'],
      patientMobile: map['patientMobile'],
      email: map['email'],
      healthConcern: map['healthConcern'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Booking.fromJson(String source) =>
      Booking.fromMap(json.decode(source));
}
