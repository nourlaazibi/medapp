import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medapp/components/splash_widget.dart';
import 'package:medapp/model/user.dart';
import 'package:medapp/pages/home/home.dart';
import 'package:medapp/pages/login/login_page.dart';
import 'package:medapp/providers/user_provider.dart';
import 'package:medapp/services/db/user_db.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CurrentUserProvider>(context);
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;

          // Ensure the user is logged in
          if (user != null) {
            return FutureBuilder<UserModel?>(
              future: _getCurrentUser(user.uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Show loading indicator
                  return SplashWidget();
                } else {
                  if (snapshot.hasData && snapshot.data != null) {
                    // Return home
                    currentUser.setCurrentUser(snapshot.data!);
                    return Home();
                  } else {
                    // Show auth
                    return LoginPage();
                  }
                }
              },
            );
          } else {
            // Show auth
            return LoginPage();
          }
        } else {
          // Show loading indicator
          return SplashWidget();
        }
      },
    );
  }

  Future<UserModel?> _getCurrentUser(String uid) async {
    UserModel? userModel = await UserDB().getUser(uid);
    if (userModel == null) {
      // Log out if user data doesn't exist in Firestore
      await FirebaseAuth.instance.signOut();
    }
    return userModel;
  }
}
