import 'package:flutter/material.dart';
import 'package:medapp/model/user.dart';

class CurrentUserProvider extends ChangeNotifier {
  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  void setCurrentUser(UserModel user) {
    _currentUser = user;
    notifyListeners();
  }
}
