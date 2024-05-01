import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'profile_info_tile.dart';

class InfoWidget extends StatelessWidget {
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
            'Tawfiq Bahri',
            style: Theme.of(context).textTheme.subtitle2,
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
          trailing: '0781 348 677',
          hint: 'Add phone number',
        ),
        ProfileInfoTile(
          title: 'email'.tr(),
          trailing: 'bhr.tawfik@gmail.com',
          hint: 'add_email'.tr(),
        ),
        ProfileInfoTile(
          title: 'gender'.tr(),
          trailing: 'male'.tr(),
          hint: 'add_gender'.tr(),
        ),
        ProfileInfoTile(
          title: 'date_of_birth'.tr(),
          trailing: null,
          hint: 'yyyy mm dd',
        ),
        ProfileInfoTile(
          title: 'blood_group'.tr(),
          trailing: 'O+',
          hint: 'add_blood_group'.tr(),
        ),
        ProfileInfoTile(
          title: 'marital_status'.tr(),
          trailing: null,
          hint: 'add_marital_status'.tr(),
        ),
        ProfileInfoTile(
          title: 'height'.tr(),
          trailing: null,
          hint: 'add_height'.tr(),
        ),
        ProfileInfoTile(
          title: 'weight'.tr(),
          trailing: null,
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
