import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app_elred/services/firebase_service.dart';
import 'package:todo_app_elred/services/google_auth_service.dart';
import 'package:todo_app_elred/styles/colors.dart';
import 'package:todo_app_elred/styles/fonts.dart';

class SignInWithGooglePage extends StatelessWidget {
  const SignInWithGooglePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {
          Authentication().signInWithGoogle().then((value) {
            if (value.user?.displayName != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.black,
                  duration: Duration(seconds: 3),
                  content: Text('Sign-in Success'),
                ),
              );

              FirebaseService.getUserDBData();

              Future.delayed(const Duration(seconds: 2), () {
                Navigator.pushReplacementNamed(context, '/Homepage');
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.black,
                  duration: Duration(seconds: 6),
                  content: Text('Sign-in Failed'),
                ),
              );
            }
          });
        },
        child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            height: 60,
            width: MediaQuery.of(context).size.width / 1.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: AppColors.signInColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sigin in with',
                  style: AppFonts.siginText,
                ),
                Image.asset(
                  'assets/google_logo.png',
                  height: 60,
                  width: 80,
                ),
              ],
            )),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image.png'), fit: BoxFit.fitHeight)),
      ),
    );
  }
}
