import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medapp/model/user.dart';
import 'package:medapp/services/auth/user_auth.dart';
import 'package:medapp/services/db/user_db.dart';
import 'package:medapp/wrapper.dart';

import '../../../components/custom_icons.dart';
import '../../../components/social_icon.dart';

class SocialLoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Divider(
                color: Colors.grey,
                endIndent: 20,
              ),
            ),
            Text(
              'social_login'.tr(),
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Expanded(
              child: Divider(
                color: Colors.grey,
                indent: 20,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // SocialIcon(
            //   colors: [
            //     Color(0xff102397),
            //     Color(0xff187adf),
            //   ],
            //   iconData: CustomIcons.facebook,
            //   onPressed: () {},
            // ),
            SocialIcon(
              colors: [
                Color(0xffff4f38),
                Color(0xff1ff355d),
              ],
              iconData: CustomIcons.googlePlus,
              onPressed: () async {
                try {
                  UserCredential me = await UserAuth().signInWithGoogle();
                  UserModel userModel = UserModel(
                      id: me.user!.uid,
                      firstName: me.user!.displayName!,
                      lastName: "",
                      email: me.user!.email!,
                      gender: 1,
                      profilePicture: me.user!.photoURL);
                  await UserDB().addUser(userModel);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Wrapper()),
                  );
                } catch (e) {}
              },
            ),
          ],
        ),
      ],
    );
  }
}
