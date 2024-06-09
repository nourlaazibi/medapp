import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medapp/model/booking.dart';
import 'package:medapp/model/doctor.dart';
import 'package:medapp/providers/doctors_provider.dart';
import 'package:provider/provider.dart';

class BookingDB {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference<Map<String, dynamic>> _bookingsRef =
      FirebaseFirestore.instance.collection('bookings');

  Future<List<Booking>> fetchAllBookings() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('bookings').get();
      return snapshot.docs.map((doc) => Booking.fromMap(doc.data())).toList();
    } catch (e) {
      print('Error fetching bookings: $e');
      return [];
    }
  }

  Future<void> addBooking(Booking booking) async {
    try {
      await _firestore
          .collection('bookings')
          .doc(booking.id)
          .set(booking.toMap());
    } catch (e) {
      print('Error adding booking: $e');
    }
  }

  Future<void> updateBooking(String id, Booking updatedBooking) async {
    try {
      await _firestore
          .collection('bookings')
          .doc(id)
          .update(updatedBooking.toMap());
    } catch (e) {
      print('Error updating booking: $e');
    }
  }

  Future<List<Doctor>> getVisitedDoctors(
      String userId, BuildContext context) async {
    final doctors = Provider.of<DoctorsProvider>(context).doctors;
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _bookingsRef.where('userId', isEqualTo: userId).get();

      List<Doctor> visitedDoctors = [];
      for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
        Booking booking = Booking.fromMap(doc.data());
        Doctor doctor =
            doctors.firstWhere((element) => element.id == booking.doctorId);
        if (!visitedDoctors.contains(doctor)) {
          visitedDoctors.add(doctor);
        }
      }

      return visitedDoctors;
    } catch (e) {
      print('Error getting visited doctors: $e');
      return [];
    }
  }

  Future<Booking?> fetchMostRecentActiveBooking(String userId) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await _bookingsRef
          .where('userId', isEqualTo: userId)
          .orderBy('date', descending: false)
          .get();

      DateTime now = DateTime.now();

      List<Booking> activeBookings = snapshot.docs.map((doc) {
        return Booking.fromMap(doc.data());
      }).where((booking) {
        DateTime bookingDateTime = booking.date.toDate();
        return bookingDateTime.isAfter(now.subtract(Duration(days: 1))) ||
            bookingDateTime.day == now.day;
      }).toList();

      if (activeBookings.isEmpty) {
        return null;
      }
      return activeBookings.first;
    } catch (e) {
      print('Error fetching most recent active booking: $e');
      return null;
    }
  }

  Future<List<Booking>> getUserBookings(String userId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _bookingsRef
          .where('userId', isEqualTo: userId)
          .orderBy('date', descending: true)
          .get();

      return snapshot.docs.map((doc) => Booking.fromMap(doc.data())).toList();
    } catch (e) {
      print('Error fetching user bookings: $e');
      return [];
    }
  }
}
