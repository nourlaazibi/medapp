import 'dart:math';
import 'package:medapp/utils/check_if_id_exist.dart';

Future<int> generateUniqueId() async {
  int id=9000000;
  bool idExists = true;
  final int maxAttempts = 100; 

  for (int attempt = 0; attempt < maxAttempts && idExists; attempt++) {
    id = _generateRandomId();
    idExists = await checkIfIdExists(id);
  }

  if (idExists) {
    throw Exception('Failed to generate a unique ID after $maxAttempts attempts.');
  }

  return id;
}

int _generateRandomId() {
 
  return Random().nextInt(9000000) + 1000000;
}

