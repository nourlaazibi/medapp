import 'dart:math';

String generateRandomId() {
  String randomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
  }

  final timestamp = DateTime.now().millisecondsSinceEpoch;

  final randomId = '$timestamp${randomString(6)}';

  return randomId;
}


String numberId() {
  final random = Random();
  final int timestamp = DateTime.now().millisecondsSinceEpoch;

  
  final int randomNum = random.nextInt(9000) + 1000;
  final String idString = '$timestamp$randomNum';
  final int uniqueId = int.parse(idString.substring(idString.length - 7));

  return uniqueId.toString();
}
