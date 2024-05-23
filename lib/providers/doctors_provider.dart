import 'package:flutter/material.dart';
import 'package:medapp/model/doctor.dart';

class DoctorsProvider extends ChangeNotifier {
  List<Doctor> _doctors = [];
  List<Doctor> get doctors => _doctors;
  void updateList(List<Doctor> list) {
    _doctors = list;
    notifyListeners();
  }
}
