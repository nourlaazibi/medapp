import 'dart:convert';

class Doctor {
  final String id;
  String fullName;
  int idSpeciality;
  String? email;
  String? phone;
  String? about;
  String? avatar;
  double? rating;
  int? price;
  int? goodReviews;
  int? totaScore;
  int? satisfaction;
  int? visitDuration;
  List<String>? workingDays;
  double? latitude;
  double? longitude;

  Doctor({
    required this.id,
    required this.fullName,
    required this.idSpeciality,
    this.email,
    this.phone,
    this.about,
    this.avatar,
    this.rating,
    this.price,
    this.goodReviews,
    this.totaScore,
    this.satisfaction,
    this.visitDuration,
    this.workingDays,
    this.latitude,
    this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'latitude': latitude,
      'longitude': longitude,
      'about': about,
      'avatar': avatar,
      'rating': rating,
      'price': price,
      'idSpeciality': idSpeciality,
      'goodReviews': goodReviews,
      'totaScore': totaScore,
      'satisfaction': satisfaction,
      'visitDuration': visitDuration,
      'workingDays': workingDays, //workingDays?.map((x) => x.toMap()).toList(),
    };
  }

  factory Doctor.fromMap(Map<String, dynamic>? map) {
    if (map == null) throw ArgumentError("Null doctor data");

    return Doctor(
      id: map['id'],
      fullName: map['fullName'],
      email: map['email'],
      phone: map['phone'],
      about: map['about'],
      avatar: map['avatar'],
      rating: (map['rating'] as num?)?.toDouble(),
      price: map['price'],
      idSpeciality: map['idSpeciality'],
      goodReviews: map['goodReviews'],
      totaScore: map['totaScore'],
      satisfaction: map['satisfaction'],
      visitDuration: map['visitDuration'],
      latitude: (map['latitude'] as num?)?.toDouble(),
      longitude: (map['longitude'] as num?)?.toDouble(),
      workingDays: map['workingDays']?.cast<String>(),
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
