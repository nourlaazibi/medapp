import 'dart:convert';

class User {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
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
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
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
      'password': password,
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

  factory User.fromMap(Map<String, dynamic>? map) {
    if (map == null) return User();

    return User(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      password: map['password'],
      gender: map['gender'],
      phone: map['phone'],
      birthDate: map['birthDate'],
      bloodGroup: map['bloodGroup'],
      maritalStatus: map['maritalStatus'],
      height: map['height'],
      weight: map['weight'],
      emeregencyContact: map['emeregencyContact'],
      avatar: map['avatar'],
      location: map['location'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
