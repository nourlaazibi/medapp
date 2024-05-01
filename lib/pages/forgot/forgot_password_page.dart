import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../components/custom_button.dart';
import '../../components/text_form_field.dart';
import '../../utils/constants.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 38),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          height: 80,
                        ),
                      ),
                      Text(
                        'forgot_password'.tr(),
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      WidgetForgot(),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'login'.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .button!
                                .copyWith(fontSize: 12),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 20,
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

class WidgetForgot extends StatefulWidget {
  @override
  _WidgetForgotState createState() => _WidgetForgotState();
}

class _WidgetForgotState extends State<WidgetForgot> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'email_dot'.tr(),
          style: kInputTextStyle,
        ),
        CustomTextFormField(
          controller: _emailController,
          hintText: 'bhr.tawfik@gmail.com',
        ),
        SizedBox(
          height: 35,
        ),
        CustomButton(
          onPressed: () {},
          text: 'reset_password'.tr(),
        )
      ],
    );
  }
}
