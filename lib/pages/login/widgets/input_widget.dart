import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../components/labeled_text_form_field.dart';
import '../../../routes/routes.dart';

class InputWidget extends StatefulWidget {
  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        LabeledTextFormField(
          title: 'email_dot'.tr(),
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          hintText: 'bhr.tawfik@gmail.com',
        ),
        LabeledTextFormField(
          title: 'password_dot'.tr(),
          controller: _passwordController,
          obscureText: true,
          hintText: '* * * * * *',
          padding: 0,
        ),
        Row(
          children: [
            Expanded(
              child: Container(),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.forgotPassword);
              },
              child: Text(
                'forgot_yout_password'.tr(),
                style:
                    Theme.of(context).textTheme.button!.copyWith(fontSize: 12),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
