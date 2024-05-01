import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../components/text_form_field.dart';
import '../../../utils/constants.dart';

class EditWidget extends StatefulWidget {
  @override
  _EditWidgetState createState() => _EditWidgetState();
}

class _EditWidgetState extends State<EditWidget> {
  final ImagePicker _picker = ImagePicker();

  var _selectedGender = 'male'.tr();

  var _selectedBloodGroup = 'O+';
  var _selectedMarital = 'single'.tr();
  var _genderItems = <String>['male'.tr(), 'female'.tr()];
  static const _bloodItems = <String>[
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-'
  ];
  var _maritalItems = <String>['single'.tr(), 'married'.tr()];

  var _birthDate = '01/01/2000';

  late List<DropdownMenuItem<String>> _dropDownGender;
  late List<DropdownMenuItem<String>> _dropDownMarital;

  List<DropdownMenuItem<String>> _dropDownBlood = _bloodItems
      .map((String value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          ))
      .toList();

  File? _image;

  Future _getImage(ImageSource imageSource) async {
    final imageFile = await _picker.pickImage(source: imageSource);
    if (imageFile != null) {
      setState(() {
        _image = File(imageFile.path);
      });
    }
    //uploadPic();
  }

  _initDropDowns() {
    _dropDownGender = _genderItems
        .map((String value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            ))
        .toList();

    _dropDownMarital = _maritalItems
        .map((String value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            ))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    _initDropDowns();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: GestureDetector(
                onTap: () {
                  _openBottomSheet(context);
                },
                child: _image == null
                    ? CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey,
                        //backgroundImage: NetworkImage(avatarUrl),
                      )
                    : CircleAvatar(
                        radius: 30,
                        backgroundImage: FileImage(_image!),
                      ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  _openBottomSheet(context);
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(4)),
                child: Text(
                  'change_avatar'.tr(),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'first_name_dot'.tr(),
              style: kInputTextStyle,
            ),
            CustomTextFormField(
              hintText: 'John',
              validator: (value) =>
                  value!.isEmpty ? 'Please insert a valid first name' : null,
            ),
            SizedBox(height: 15),
            Text(
              'last_name_dot'.tr(),
              style: kInputTextStyle,
            ),
            CustomTextFormField(
              hintText: 'Doe',
              validator: (value) =>
                  value!.isEmpty ? 'Please insert a valid last name' : null,
            ),
            SizedBox(height: 15),
            Text(
              'contact_number_dot'.tr(),
              style: kInputTextStyle,
            ),
            CustomTextFormField(
              keyboardType: TextInputType.phone,
              hintText: '0781 34 86 77',
            ),
            SizedBox(height: 15),
            Text(
              'email_dot'.tr(),
              style: kInputTextStyle,
            ),
            CustomTextFormField(
              hintText: 'bhr.tawfik@gmail.com',
              enabled: false,
            ),
            SizedBox(height: 15),
            Text(
              'gender_dot'.tr(),
              style: kInputTextStyle,
            ),
            DropdownButton(
              isExpanded: true,
              value: _selectedGender,
              //hint: ,
              onChanged: (String? value) {
                setState(() {
                  _selectedGender = value!;
                });
              },
              items: _dropDownGender,
            ),
            SizedBox(height: 15),
            Text(
              'date_of_birth_dot'.tr(),
              style: kInputTextStyle,
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(_birthDate),
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                ).then((DateTime? value) {
                  if (value != null) {
                    setState(() {
                      _birthDate = value.toString();
                    });
                  }
                });
              },
            ),
            SizedBox(height: 15),
            Text(
              'blood_group_dot'.tr(),
              style: kInputTextStyle,
            ),
            DropdownButton(
              isExpanded: true,
              value: _selectedBloodGroup,
              //hint: ,
              onChanged: (String? value) {
                setState(() {
                  _selectedBloodGroup = value!;
                });
              },
              items: _dropDownBlood,
            ),
            SizedBox(height: 15),
            Text(
              'marital_status_dot'.tr(),
              style: kInputTextStyle,
            ),
            DropdownButton(
              isExpanded: true,
              value: _selectedMarital,
              //hint: ,
              onChanged: (String? value) {
                setState(() {
                  _selectedMarital = value!;
                });
              },
              items: _dropDownMarital,
            ),
            SizedBox(height: 15),
            Text(
              'height_dot'.tr(),
              style: kInputTextStyle,
            ),
            CustomTextFormField(
              keyboardType: TextInputType.number,
              hintText: 'in_cm'.tr(),
            ),
            SizedBox(height: 15),
            Text(
              'weight_dot'.tr(),
              style: kInputTextStyle,
            ),
            CustomTextFormField(
              keyboardType: TextInputType.number,
              hintText: 'in_kg'.tr(),
            ),
          ],
        ),
      ),
    );
  }

  _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.camera,
                  size: 20,
                ),
                title: Text(
                  'take_a_photo'.tr(),
                  style: TextStyle(
                    color: Color(0xff4a4a4a),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  _getImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.photo_library,
                  size: 20,
                ),
                title: Text(
                  'choose_a_photo'.tr(),
                  style: TextStyle(
                    color: Color(0xff4a4a4a),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  _getImage(ImageSource.gallery);
                },
              ),
            ],
          );
        });
  }
}
