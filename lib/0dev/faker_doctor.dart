import 'dart:math';
import 'package:faker/faker.dart';
import 'package:medapp/model/doctor.dart';
import 'package:medapp/utils/random_id.dart';

final faker = Faker();
final random = Random();
final _random = Random();
double getRandomLatitude() {
  // Latitude range for Tunisia: 30.14 to 37.34
  return 30.14 + _random.nextDouble() * (37.34 - 30.14);
}

double getRandomLongitude() {
  // Longitude range for Tunisia: 7.52 to 11.56
  return 7.52 + _random.nextDouble() * (11.56 - 7.52);
}

List<Doctor> generateRandomDoctors(int count) {
  List<Doctor> doctors = [];

  for (int i = 0; i < count; i++) {
    doctors.add(
      Doctor(
        id:(Random().nextInt(9000000) + 1000000).toString(),
        fullName: getRandomArabicName(),
        idSpeciality: random.nextInt(10) + 1,
        email: faker.internet.email(),
        phone: generateTunisianPhoneNumber(),
        about: faker.lorem.sentences(3).join(' '),
        avatar: 'assets/images/icon_doctor_${random.nextInt(5) + 1}.png',
        rating: (random.nextDouble() * 5).clamp(3.0, 5.0),
        price: random.nextInt(200) + 50,
        goodReviews: random.nextInt(100),
        totaScore: random.nextInt(100),
        satisfaction: random.nextInt(100),
        visitDuration: random.nextInt(60) + 15,
        latitude: getRandomLatitude(),
        longitude: getRandomLongitude(),
        workingDays: List.generate(3, (_) => (random.nextInt(10)).toString()),
      ),
    );
  }

  return doctors;
}

List<String> arabicFirstNames = [
  'Mohammed',
  'Maha',
  'Ali',
  'Youssef',
  'Fatma',
  'Ibrahim',
  'Khaled',
  'Marwan',
  'Ayman',
  'Imen',
  'Omar',
  'Zainab',
  'Layla',
  'Amir',
  'Hassan',
  'Noor',
  'Sara',
  'Nadia',
  'Samir',
  'Rania',
  'Karim',
  'Hala',
  'Bilal',
  'Lina',
  'Samira',
  'Fares',
  'Mona',
  'Rami',
  'Jamal',
  'Nour'
];

List<String> arabicLastNames = [
  'Zuhairi',
  'Mejri',
  'Sayed',
  'Hamidi',
  'Saleh',
  'Balkhi',
  'Amiri',
  'Sharif',
  'Mahdi',
  'Hashimi',
  'Abbasi',
  'Ghani',
  'Hussein',
  'Aziz',
  'Faruqi',
  'Khan',
  'Malik',
  'Nasser',
  'Qureshi',
  'Rahman',
  'Siddiqui',
  'Tariq',
  'Usmani',
  'Wahid',
  'Yazid',
  'Zahir',
  'Darwish',
  'Ismail',
  'Jabbar',
  'Kamal'
];

String getRandomArabicName() {
  String firstName = arabicFirstNames[_random.nextInt(arabicFirstNames.length)];
  String lastName = arabicLastNames[_random.nextInt(arabicLastNames.length)];
  return '$firstName $lastName';
}

String generateTunisianPhoneNumber() {
  int firstDigit = 7;
  int secondDigit = random.nextInt(10);
  int thirdDigit = random.nextInt(10);
  int fourthDigit = random.nextInt(10);
  int fifthDigit = random.nextInt(10);
  int sixthDigit = random.nextInt(10);
  int seventhDigit = random.nextInt(10);
  int eighthDigit = random.nextInt(10);
  return '+216 $firstDigit$secondDigit $thirdDigit$fourthDigit$seventhDigit $fifthDigit$sixthDigit$eighthDigit$secondDigit';
}
