import 'dart:convert';

class User {
  final String id;
  String? firstName;
  String? lastName;
  String? email;
  int? gender;
  String? phone;
  String? birthDate;
  String? bloodGroup;
  String? maritalStatus;
  double? height;
  double? weight;
  String? emeregencyContact;
  String? avatar;
  String? location;

  User({
    required this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.birthDate,
    this.bloodGroup,
    this.maritalStatus,
    this.height,
    this.weight,
    this.emeregencyContact,
    this.avatar,
    this.location,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'gender': gender,
      'phone': phone,
      'birthDate': birthDate,
      'bloodGroup': bloodGroup,
      'maritalStatus': maritalStatus,
      'height': height,
      'weight': weight,
      'emeregencyContact': emeregencyContact,
      'avatar': avatar,
      'location': location,
    };
  }

  factory User.fromMap(Map<String, dynamic>? map, String id) {
    if (map == null) {
      throw ArgumentError("Null map passed to User.fromMap");
    }

    return User(
      id: id,
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      gender: map['gender'] ?? 0,
      phone: map['phone'] ?? '',
      birthDate: map['birthDate'] ?? '',
      bloodGroup: map['bloodGroup'] ?? '',
      maritalStatus: map['maritalStatus'] ?? '',
      height: map['height']?.toDouble() ?? 0.0,
      weight: map['weight']?.toDouble() ?? 0.0,
      emeregencyContact: map['emeregencyContact'] ?? '',
      avatar: map['avatar'] ?? '',
      location: map['location'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source), '');
}
