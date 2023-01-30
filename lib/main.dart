import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_elred/pages/home/home_page.dart';
import 'package:todo_app_elred/pages/home/home_page_components/loading_screen.dart';
import 'package:todo_app_elred/pages/home/home_page_components/new_todo_page.dart';
import 'package:todo_app_elred/pages/intro/todo_video_screen.dart';
import 'package:todo_app_elred/pages/sign_in/sign_in_page.dart';
import 'package:todo_app_elred/services/hive.dart';
import 'package:todo_app_elred/services/navigator.dart';

import 'pages/home/home_page_components/add_newthing_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  HiveInstance.initialiseHive();
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ).copyWith(
          pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
        },
      )),
      navigatorKey: NavigationService().navigatorKey,
      routes: {
        '/AddTaskPage': (context) => const AddNewTodoPage(),
        '/Homepage': (context) => const Homepage(),
        '/SignInpage': (context) => const SignInWithGooglePage(),
        '/LoadingPage': (context) => LoadingScreen(),
        '/TodoPage': (context) => const NewTodoPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/AddTaskPage') {
          return PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 80),
            pageBuilder: (_, __, ___) => const AddNewTodoPage(),
            transitionsBuilder: (_, anim, __, child) {
              return FadeTransition(opacity: anim, child: child);
            },
          );
        }
        if (settings.name == '/Homepage') {
          return PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 0),
            pageBuilder: (_, __, ___) => const Homepage(),
            transitionsBuilder: (_, anim, __, child) {
              return FadeTransition(opacity: anim, child: child);
            },
          );
        }

        if (settings.name == '/TodoPage') {
          return PageRouteBuilder(
            transitionDuration: const Duration(seconds: 3),
            pageBuilder: (_, __, ___) => const NewTodoPage(),
            transitionsBuilder: (_, anim, __, child) {
              return FadeTransition(opacity: anim, child: child);
            },
          );
        }
        if (settings.name == '/LoadingPage') {
          return PageRouteBuilder(
            transitionDuration: const Duration(seconds: 3),
            pageBuilder: (_, __, ___) => LoadingScreen(),
            transitionsBuilder: (_, anim, __, child) {
              return FadeTransition(opacity: anim, child: child);
            },
          );
        }
        return null;
      },
      home: const TodoVideoScreen(),
      //)
    );
  }
}
