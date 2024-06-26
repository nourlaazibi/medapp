import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medapp/model/doctor.dart';
import 'package:medapp/model/user.dart';
import 'package:medapp/pages/map/main_map.dart';

import '../../routes/routes.dart';
import '../../utils/constants.dart';

class DrawerPage extends StatelessWidget {
  final void Function() onTap;
  UserModel userModel;
  final List<Doctor> doctors;
  DrawerPage(
      {Key? key,
      required this.onTap,
      required this.userModel,
      required this.doctors})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Scaffold(
        backgroundColor: kColorPrimary,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 35,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      userModel.profilePicture == null
                          ? userModel.gender == 0
                              ? CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.grey,
                                  backgroundImage: AssetImage(
                                    'assets/images/icon_man.png',
                                  ))
                              : CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.grey,
                                  backgroundImage: AssetImage(
                                    'assets/images/woman.png',
                                  ))
                          : CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey,
                              backgroundImage: NetworkImage(
                                userModel.profilePicture!,
                              )),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            '${userModel.firstName} ${userModel.lastName}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            userModel.bloodGroup != null
                                ? userModel.bloodGroup!
                                : '',
                            style: TextStyle(
                              color: kColorSecondary,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // _drawerItem(
                //   image: 'person',
                //   text: 'my_doctors',
                //   onTap: () =>
                //       Navigator.of(context).pushNamed(Routes.myDoctors),
                // ),
                // _drawerItem(
                //   image: 'calendar',
                //   text: 'my_appointments',
                //   onTap: () =>
                //       Navigator.of(context).pushNamed(Routes.myAppointments),
                // ),
                _drawerItem(
                  image: 'map',
                  text: 'Map',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MapScreen(doctors: doctors)),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell _drawerItem({
    required String image,
    required String text,
    required Function onTap,
  }) {
    return InkWell(
      onTap: () {
        onTap();
        //this.onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 58,
        child: Row(
          children: <Widget>[
            Image.asset(
              'assets/images/$image.png',
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text.tr(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
