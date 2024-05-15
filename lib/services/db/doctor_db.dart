import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medapp/model/doctor.dart';

Future<List<Doctor>> getAllDoctors() async {
  CollectionReference doctorsRef =
      FirebaseFirestore.instance.collection('doctors');

  try {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await doctorsRef.get() as QuerySnapshot<Map<String, dynamic>>;

    List<Doctor> doctors =
        snapshot.docs.map((doc) => Doctor.fromMap(doc.data())).toList();

    return doctors;
  } catch (e) {
    print('Error fetching doctors: $e');
    return [];
  }
}
