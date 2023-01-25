import 'package:flutter/material.dart';
import 'package:todo_app_elred/models/user_details.dart';
import 'package:todo_app_elred/pages/home/home_page.dart';
import 'package:todo_app_elred/pages/sign_in/sign_in_page.dart';
import 'package:todo_app_elred/services/global.dart';

class LoadingScreen extends StatelessWidget {
  LoadingScreen({
    Key? key,
  }) : super(key: key);

  UserDetails? userDetails =
      Global.boxes[BOXNAME.USER_DETAILS_BOX]?.get('userdetails');
  @override
  Widget build(BuildContext context) {
    Widget checkWidget =
        userDetails != null ? const Homepage() : const SignInWithGooglePage();
    return checkWidget;
  }
}
