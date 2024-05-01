import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../components/custom_button.dart';
import '../../components/wave_header.dart';
import '../../routes/routes.dart';
import 'widgets/input_widget.dart';

class SignupPage extends StatelessWidget {
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
                          InputWidget(),
                          SizedBox(
                            height: 35,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 38),
                            child: CustomButton(
                              onPressed: () => Navigator.of(context)
                                  .popUntil(ModalRoute.withName(Routes.login)),
                              text: 'sign_up'.tr(),
                            ),
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
