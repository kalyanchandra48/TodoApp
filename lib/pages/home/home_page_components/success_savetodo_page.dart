import 'package:flutter/material.dart';

class TodoSaveSuccessPage extends StatelessWidget {
  const TodoSaveSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/Homepage');
    });
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fitHeight, image: AssetImage('assets/success.gif')),
      ),
    );
  }
}
