import 'dart:convert';

class HealthCategory {
  int? id;
  String? name;
  String? imagePath;

  HealthCategory({
    this.id,
    this.name,
    this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imagePath': imagePath,
    };
  }

  factory HealthCategory.fromMap(Map<String, dynamic>? map) {
    if (map == null) return HealthCategory();

    return HealthCategory(
      id: map['id'],
      name: map['name'],
      imagePath: map['imagePath'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HealthCategory.fromJson(String source) =>
      HealthCategory.fromMap(json.decode(source));
}

final healthCategories = [
  HealthCategory(
    id: 0,
    name: 'category_women_health',
    imagePath: 'assets/images/pregnant.png',
  ),
  HealthCategory(
    id: 1,
    name: 'category_skin',
    imagePath: 'assets/images/personal-care.png',
  ),
  HealthCategory(
    id: 2,
    name: 'category_child',
    imagePath: 'assets/images/baby.png',
  ),
  HealthCategory(
    id: 3,
    name: 'category_general_physician',
    imagePath: 'assets/images/stethoscope.png',
  ),
  HealthCategory(
    id: 4,
    name: 'category_dental',
    imagePath: 'assets/images/dental-care.png',
  ),
  HealthCategory(
    id: 5,
    name: 'category_ear',
    imagePath: 'assets/images/throat.png',
  ),
  HealthCategory(
    id: 6,
    name: 'category_homoetherapy',
    imagePath: 'assets/images/medicine.png',
  ),
  HealthCategory(
    id: 7,
    name: 'category_bone',
    imagePath: 'assets/images/knee.png',
  ),
  HealthCategory(
    id: 8,
    name: 'category_sex_specialist',
    imagePath: 'assets/images/sex.png',
  ),
  HealthCategory(
    id: 9,
    name: 'category_eye',
    imagePath: 'assets/images/view.png',
  ),
  HealthCategory(
    id: 10,
    name: 'category_digestive',
    imagePath: 'assets/images/stomach.png',
  ),
  HealthCategory(
    id: 11,
    name: 'category_mental',
    imagePath: 'assets/images/love.png',
  ),
  HealthCategory(
    id: 12,
    name: 'category_physiotherapy',
    imagePath: 'assets/images/healthcare-and-medical.png',
  ),
  HealthCategory(
    id: 13,
    name: 'category_diabetes',
    imagePath: 'assets/images/glucosemeter.png',
  ),
  HealthCategory(
    id: 14,
    name: 'category_brain',
    imagePath: 'assets/images/stethoscope-2.png',
  ),
  HealthCategory(
    id: 15,
    name: 'category_general_surgery',
    imagePath: 'assets/images/surgeon.png',
  ),
  HealthCategory(
    id: 16,
    name: 'category_lungs',
    imagePath: 'assets/images/lungs.png',
  ),
  HealthCategory(
    id: 17,
    name: 'category_heart',
    imagePath: 'assets/images/electrocardiogram.png',
  ),
  HealthCategory(
    id: 18,
    name: 'category_cancer',
    imagePath: 'assets/images/ribbon.png',
  ),
];
