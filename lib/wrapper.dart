import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medapp/components/splash_widget.dart';
import 'package:medapp/model/doctor.dart';
import 'package:medapp/model/user.dart';
import 'package:medapp/pages/home/home.dart';
import 'package:medapp/pages/login/login_page.dart';
import 'package:medapp/providers/doctors_provider.dart';
import 'package:medapp/providers/user_provider.dart';
import 'package:medapp/services/db/doctor_db.dart';
import 'package:medapp/services/db/user_db.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    super.initState();
    _checkCurrentUser();
  }

  Future<void> _checkCurrentUser() async {
    List<Doctor> doctors = await DoctorDB().getAllDoctors();
    print("doctors $doctors");
    Provider.of<DoctorsProvider>(context, listen: false).updateList(doctors);
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        UserModel? userModel = await UserDB().getUser(user.uid);
        if (userModel != null) {
          if (mounted) {
            Provider.of<CurrentUserProvider>(context, listen: false)
                .setCurrentUser(userModel);
          }
        } else {
          await FirebaseAuth.instance.signOut();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashWidget();
        } else {
          if (snapshot.hasData && snapshot.data != null) {
            return Consumer<CurrentUserProvider>(
              builder: (context, currentUser, _) {
                if (currentUser.currentUser != null) {
                  return Home();
                } else {
                  return LoginPage();
                }
              },
            );
          } else {
            return LoginPage();
          }
        }
      },
    );
  }
}
