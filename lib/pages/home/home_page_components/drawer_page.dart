import 'package:flutter/material.dart';
import 'package:todo_app_elred/models/user_details.dart';
import 'package:todo_app_elred/services/global.dart';
import 'package:todo_app_elred/services/google_auth_service.dart';
import 'package:todo_app_elred/services/hive.dart';
import 'package:todo_app_elred/styles/colors.dart';
import 'package:todo_app_elred/styles/fonts.dart';

class DrawerPage extends StatelessWidget {
  UserDetails userDetails =
      Global.boxes[BOXNAME.USER_DETAILS_BOX]?.get('userdetails');

  DrawerPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.addTaskColor,
      semanticLabel: 'Drawer',
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: Container(
        color: Colors.grey,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          // Important: Remove any padding from the ListView.
          padding: const EdgeInsets.only(top: 40),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'Profile',
                textAlign: TextAlign.start,
                style: AppFonts.profileHeader,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 150,
              width: 250,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: NetworkImage(userDetails.profileimage))),
              child: const Text(''),
            ),
            ListTile(
              title: Text(
                'Name:   ${userDetails.name}',
                style: AppFonts.profiletext,
              ),
            ),
            ListTile(
              title: Text(
                'Email:  ${userDetails.emailid} ',
                style: AppFonts.profiletext,
                textAlign: TextAlign.start,
              ),
            ),
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
                child: ElevatedButton(
                    onPressed: () {
                      Authentication().signOutWithGoogle().then((value) {
                        HiveInstance.clearHive();
                        Navigator.pushReplacementNamed(
                          context,
                          '/SignInpage',
                        );
                      });
                    },
                    child: const Text('Sign Out')))
          ],
        ),
      ),
    );
  }
}
