import 'dart:convert';

import 'working_day.dart';

class Doctor {
  String? id;
  String? name;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? speciality;
  String? about;
  String? avatar;
  double? rating;
  int? price;
  int? idSpeciality;
  int? goodReviews;
  int? totaScore;
  int? satisfaction;
  int? visitDuration;
  List<WorkingDay>? workingDays;

  Doctor({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.speciality,
    this.about,
    this.avatar,
    this.rating,
    this.price,
    this.idSpeciality,
    this.goodReviews,
    this.totaScore,
    this.satisfaction,
    this.visitDuration,
    this.workingDays,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'speciality': speciality,
      'about': about,
      'avatar': avatar,
      'rating': rating,
      'price': price,
      'idSpeciality': idSpeciality,
      'goodReviews': goodReviews,
      'totaScore': totaScore,
      'satisfaction': satisfaction,
      'visitDuration': visitDuration,
      'workingDays': workingDays?.map((x) => x.toMap()).toList(),
    };
  }

  factory Doctor.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Doctor();

    return Doctor(
      id: map['id'],
      name: map['name'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      phone: map['phone'],
      speciality: map['speciality'],
      about: map['about'],
      avatar: map['avatar'],
      rating: map['rating'],
      price: map['price'],
      idSpeciality: map['idSpeciality'],
      goodReviews: map['goodReviews'],
      totaScore: map['totaScore'],
      satisfaction: map['satisfaction'],
      visitDuration: map['visitDuration'],
      workingDays: List<WorkingDay>.from(
          map['workingDays']?.map((x) => WorkingDay.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Doctor.fromJson(String source) => Doctor.fromMap(json.decode(source));
}

class Doctors {
  List<Doctor>? doctorList;

  Doctors({this.doctorList});

  factory Doctors.fromJSON(Map<dynamic, dynamic> json) {
    return Doctors(doctorList: parserecipes(json));
  }

  static List<Doctor> parserecipes(doctorJSON) {
    var dList = doctorJSON['doctors'] as List;
    List<Doctor> doctorList =
        dList.map((data) => Doctor.fromJson(data)).toList();
    return doctorList;
  }
}

final doctors = [
  Doctor(
    name: 'Tawfiq Bahri',
    speciality: 'Family Doctor, Cardiologist',
    about:
        'Candidate of medical sciences, gynecologist, specialist with experience more than 5 years.',
    avatar: 'assets/images/icon_doctor_1.png',
    rating: 4.5,
    price: 100,
  ),
  Doctor(
    name: 'Trashae Hubbard',
    speciality: 'Family Doctor, Therapist',
    about:
        'Candidate of medical sciences, gynecologist, specialist with experience more than 5 years.',
    avatar: 'assets/images/icon_doctor_2.png',
    rating: 4.7,
    price: 90,
  ),
  Doctor(
    name: 'Jesus Moruga',
    speciality: 'Family Doctor, Therapist',
    about:
        'Candidate of medical sciences, gynecologist, specialist with experience more than 5 years.',
    avatar: 'assets/images/icon_doctor_3.png',
    rating: 4.3,
    price: 100,
  ),
  Doctor(
    name: 'Gabriel Moreira',
    speciality: 'Family Doctor, Therapist',
    about:
        'Candidate of medical sciences, gynecologist, specialist with experience more than 5 years.',
    avatar: 'assets/images/icon_doctor_4.png',
    rating: 4.7,
    price: 100,
  ),
  Doctor(
    name: 'Liana Lee',
    speciality: 'Family Doctor, Therapist',
    about:
        'Candidate of medical sciences, gynecologist, specialist with experience more than 5 years.',
    avatar: 'assets/images/icon_doctor_5.png',
    rating: 4.7,
    price: 100,
  ),
];
