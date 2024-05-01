import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../components/custom_button.dart';
import '../../components/wave_header.dart';
import '../../routes/routes.dart';
import 'widgets/input_widget.dart';
import 'widgets/social_login_widget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
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
                            InputWidget(),
                            CustomButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .popAndPushNamed(Routes.home);
                              },
                              text: 'login'.tr(),
                              
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
                                              .button!
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
          );
        },
      ),
    );
  }
}


