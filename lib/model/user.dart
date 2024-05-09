import 'dart:convert';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  String email;
  String? profilePicture;
  int gender;
  double? height;
  double? weight;
  String? phone;
  String? birthDate;
  String? bloodGroup;
  String? maritalStatus;
  String? emeregencyContact;
  String? avatar;
  String? location;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    this.phone,
    this.birthDate,
    this.bloodGroup,
    this.maritalStatus,
    this.height,
    this.weight,
    this.emeregencyContact,
    this.avatar,
    this.location,
    this.profilePicture
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
      'profilePicture':profilePicture
    };
  }

  factory UserModel.fromMap(Map<String, dynamic>? map, String id) {
    if (map == null) {
      throw ArgumentError("Null map passed to UserModel.fromMap");
    }

    return UserModel(
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
      profilePicture:map['profilePicture'] ?? null
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source), '');
}
