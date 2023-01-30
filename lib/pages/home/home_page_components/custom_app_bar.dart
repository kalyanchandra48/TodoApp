import 'package:flutter/material.dart';
import 'package:todo_app_elred/styles/colors.dart';
import 'package:todo_app_elred/styles/fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required GlobalKey<ScaffoldState> scaffoldKey,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      snap: true,
      stretch: true,
      backgroundColor: AppColors.addTaskColor,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(
            left: 7.0,
          ),
          child: Text(
            'Your Things',
            style: AppFonts.profiletext,
            textAlign: TextAlign.center,
          ),
        ),
        background: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/todo_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      expandedHeight: 290,

      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        tooltip: 'Menu',
        onPressed: () {
          _scaffoldKey.currentState!.openDrawer();
        },
      ), //IconButton
      // actions: <Widget>[
      //   Padding(
      //     padding: const EdgeInsets.only(right: 25.0),
      //     child: IconButton(
      //         tooltip: 'Theme',
      //         onPressed: () {

      //         },
      //         icon: value
      //             ? const Icon(
      //                 Icons.dark_mode_rounded,
      //                 color: Colors.white,
      //               )
      //             : const Icon(
      //                 Icons.sunny,
      //                 color: Colors.white,
      //               )),
      //   )
      // ])
    );
  }
}
