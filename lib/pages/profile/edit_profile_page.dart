import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medapp/model/user.dart';

import '../../components/custom_button.dart';
import '../../utils/constants.dart';
import 'widgets/edit_widget.dart';
import 'widgets/info_widget.dart';

class EditProfilePage extends StatefulWidget {
  final UserModel userModel;

  const EditProfilePage({super.key, required this.userModel});
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool _editing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('edit_profile'.tr()),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                _editing = !_editing;
              });
            },
            icon: Icon(
              _editing ? Icons.close : Icons.edit,
              color: kColorBlue,
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: _editing ? EditWidget(userModel:widget.userModel,) : InfoWidget(userModel: widget.userModel,),
            ),
          ),
          // if (_editing)
          //   Container(
          //     padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          //     child: CustomButton(
          //       onPressed: () {},
          //       text: 'update_info'.tr(),
          //     ),
          //   )
        ],
      ),
    );
  }
}
