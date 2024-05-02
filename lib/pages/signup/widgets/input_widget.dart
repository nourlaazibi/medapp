import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:medapp/components/custom_button.dart';

import '../../../components/labeled_text_form_field.dart'; // Assurez-vous d'importer votre composant personnalisé
import '../../../utils/constants.dart';

enum Gender { male, female }

class InputWidget extends StatefulWidget {
  final Function(String, String, Gender, String, String,String,String) onSubmit;
  InputWidget({required this.onSubmit});
  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  Gender _gender = Gender.female;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 38),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              LabeledTextFormField(
                title: 'first_name_dot'.tr(),
                controller: _firstNameController,
                hintText: 'John',
              ),
              LabeledTextFormField(
                title: 'last_name_dot'.tr(),
                controller: _lastNameController,
                hintText: 'Doe',
              ),
              Text(
                'gender_dot'.tr(),
                style: kInputTextStyle,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: <Widget>[
              Radio(
                value: Gender.male,
                groupValue: _gender,
                onChanged: (Gender? gender) {
                  setState(() {
                    _gender = gender!;
                  });
                },
              ),
              Text(
                'male'.tr(),
                style: kInputTextStyle,
              ),
              SizedBox(
                width: 30,
              ),
              Radio(
                value: Gender.female,
                groupValue: _gender,
                onChanged: (Gender? gender) {
                  setState(() {
                    _gender = gender!;
                  });
                },
              ),
              Text(
                'female'.tr(),
                style: kInputTextStyle,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 38),
          child: Column(
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
              ),
              LabeledTextFormField(
                title: 'weight_dot'.tr(),
                controller: _weightController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                hintText: '70',
              ),
              LabeledTextFormField(
                title: 'height_dot'.tr(),
                controller: _heightController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                hintText: '175',
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 38),
                child: CustomButton(
                  onPressed: () {
                    widget.onSubmit(
                      _firstNameController.text,
                      _lastNameController.text,
                      _gender,
                      _emailController.text,
                      _passwordController.text,
                      _weightController.text,
                      _heightController.text
                    );
                  },
                  text: 'sign_up'.tr(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
