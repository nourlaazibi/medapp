import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:medapp/services/auth/user_auth.dart';
import 'package:medapp/wrapper.dart';

import '../../components/custom_button.dart';
import '../../components/wave_header.dart';
import '../../routes/routes.dart';
import 'widgets/input_widget.dart';
import 'widgets/social_login_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
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
                      WaveHeader(
                        title: 'Welcome'.tr(),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 38),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: SizedBox(
                                  height: 20,
                                ),
                              ),
                              Center(
                                child: Text(
                                  'login_to_your_account_to_continue'.tr(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              InputWidget(
                                //! Login
                                onSubmit: (email, password) async {
                                  setState(() {
                                    loading = !loading;
                                  });
                                  AuthResult authResult = await UserAuth()
                                      .signInWithEmailAndPassword(
                                          context, email, password);
                                  if (authResult.user != null) {
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
                                  setState(() {
                                    loading = false;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SocialLoginWidget(),
                              Expanded(
                                child: SizedBox(
                                  height: 20,
                                ),
                              ),
                              SafeArea(
                                child: Center(
                                  child: Wrap(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Text(
                                          'dont_have_an_account'.tr(),
                                          style: TextStyle(
                                            color: Color(0xffbcbcbc),
                                            fontSize: 12,
                                            fontFamily: 'NunitoSans',
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        borderRadius: BorderRadius.circular(2),
                                        onTap: () {
                                          Navigator.of(context)
                                              .pushNamed(Routes.signup);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Text(
                                            'register_now'.tr(),
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
