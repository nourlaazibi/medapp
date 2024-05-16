import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> checkIfIdExists(int id) async {
  try {
    final CollectionReference bookingRef =
        FirebaseFirestore.instance.collection('bookings');

    final QuerySnapshot<Object?> snapshot =
        await bookingRef.where('id', isEqualTo: id).limit(1).get();

    return snapshot.docs.isNotEmpty;
  } catch (e) {
    print('Error checking if ID exists: $e');
    return false;
  }
}
