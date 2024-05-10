import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medapp/model/user.dart';

import 'profile_info_tile.dart';

class InfoWidget extends StatelessWidget {
  final UserModel userModel;

  const InfoWidget({super.key, required this.userModel});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          title: Text(
            'name_dot'.tr(),
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          subtitle: Text(
            "${userModel.firstName} ${userModel.lastName}",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          trailing: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey,
            //backgroundImage: NetworkImage(avatarUrl),
          ),
        ),
        Divider(
          height: 0.5,
          color: Colors.grey[200],
          indent: 15,
          endIndent: 15,
        ),
        ProfileInfoTile(
          title: 'contact_number'.tr(),
          trailing: userModel.phone != null ? userModel.phone : "",
          hint: 'Add phone number',
        ),
        ProfileInfoTile(
          title: 'email'.tr(),
          trailing: userModel.email,
          hint: 'add_email'.tr(),
        ),
        ProfileInfoTile(
          title: 'gender'.tr(),
          trailing: userModel.gender == 0 ? 'male'.tr() : 'female'.tr(),
          hint: 'add_gender'.tr(),
        ),
        ProfileInfoTile(
          title: 'date_of_birth'.tr(),
          trailing: userModel.birthDate != null ? userModel.birthDate : null,
          hint: 'yyyy mm dd',
        ),
        ProfileInfoTile(
          title: 'blood_group'.tr(),
          trailing: userModel.bloodGroup != null ? userModel.bloodGroup : null,
          hint: 'add_blood_group'.tr(),
        ),
        ProfileInfoTile(
          title: 'marital_status'.tr(),
          trailing:
              userModel.maritalStatus != null ? userModel.maritalStatus : null,
          hint: 'add_marital_status'.tr(),
        ),
        ProfileInfoTile(
          title: 'height'.tr(),
          trailing:
              userModel.height != null ? userModel.height!.toString() : null,
          hint: 'add_height'.tr(),
        ),
        ProfileInfoTile(
          title: 'weight'.tr(),
          trailing:
              userModel.weight != null ? userModel.weight!.toString() : null,
          hint: 'add_weight'.tr(),
        ),
        ProfileInfoTile(
          title: 'emergency_contact'.tr(),
          hint: 'add_emergency_contact'.tr(),
        ),
        ProfileInfoTile(
          title: 'location'.tr(),
          hint: 'add_location'.tr(),
        ),
      ],
    );
  }
}
