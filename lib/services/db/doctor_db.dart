import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medapp/model/doctor.dart';

class DoctorDB {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  CollectionReference doctorsRef =
      FirebaseFirestore.instance.collection('doctors');
  Future<void> addDoctor(Doctor doctor) async {
    try {
      await doctorsRef.doc(doctor.id).set(doctor.toMap());
      print('Doctor added successfully');
    } catch (e) {
      print('Error adding doctor: $e');
    }
  }

  Future<void> addDoctors(List<Doctor> doctors) async {
    for (Doctor doctor in doctors) {
      await addDoctor(doctor);
    }
  }

  Future<List<Doctor>> getAllDoctors() async {
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
}
