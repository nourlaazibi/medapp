import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:medapp/model/user.dart';
import 'package:medapp/providers/user_provider.dart';
import 'package:medapp/services/auth/user_auth.dart';
import 'package:medapp/services/db/user_db.dart';
import 'package:medapp/wrapper.dart';
import 'package:provider/provider.dart';
import '../../components/wave_header.dart';

import 'widgets/input_widget.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

bool loading = false;

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CurrentUserProvider>(context);
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return LoadingOverlay(
            isLoading: loading,
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          WaveHeader(
                            title: 'welcome_to_app_name'.tr(),
                          ),
                          Theme(
                            data: ThemeData(
                              appBarTheme: AppBarTheme(
                                iconTheme: IconThemeData(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            child: AppBar(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: SizedBox(
                                height: 20,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 38),
                              child: Center(
                                child: Text(
                                  'create_an_account_to_get_started'.tr(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            InputWidget(
                              onSubmit: (firstName, lastName, gender, email,
                                  password, weight, height) async {
                                setState(() {
                                  loading = !loading;
                                });
                                if (firstName.isNotEmpty &&
                                    lastName.isNotEmpty &&
                                    email.isNotEmpty &&
                                    password.isNotEmpty) {
                                  AuthResult authResult = await UserAuth()
                                      .signUpWithEmailAndPassword(
                                          context, email, password);
                                  if (authResult.user != null) {
                                    //Sign Up successful
                                    UserModel userModel = UserModel(
                                        id: FirebaseAuth
                                            .instance.currentUser!.uid,
                                        firstName: firstName,
                                        lastName: lastName,
                                        email: email,
                                        gender: gender.index,
                                        height: double.parse(height),
                                        weight: double.parse(weight));
                                    await UserDB().addUser(userModel);
                                    currentUser.setCurrentUser(userModel);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Wrapper()),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                authResult.errorMessage!)));
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text("All field are required")));
                                }
                                print('First Name: $firstName');
                                print('Last Name: $lastName');
                                print('Gender: $gender');
                                print('Email: $email');
                                print('Password: $password');
                                setState(() {
                                  loading = !loading;
                                });
                              },
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 20,
                              ),
                            ),
                            SafeArea(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 38),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${'already_a_member'.tr()} ?',
                                      style: TextStyle(
                                        color: Color(0xffbcbcbc),
                                        fontSize: 12,
                                        fontFamily: 'NunitoSans',
                                      ),
                                    ),
                                    Text('   '),
                                    InkWell(
                                      borderRadius: BorderRadius.circular(2),
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Text(
                                          'login'.tr(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge!
                                              .copyWith(fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
