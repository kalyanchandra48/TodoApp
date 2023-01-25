import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app_elred/pages/home/home_page_components/loading_screen.dart';
import 'package:video_player/video_player.dart';

class TodoVideoScreen extends StatefulWidget {
  const TodoVideoScreen({super.key});

  @override
  State<TodoVideoScreen> createState() => _TodoVideoScreenState();
}

class _TodoVideoScreenState extends State<TodoVideoScreen> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('assets/todo.mp4')
      ..initialize().then((_) {
        setState(() {
          _controller.play();
          _controller.setPlaybackSpeed(1.15);
          _controller.setLooping(true);
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoadingScreen()));
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(
                  _controller,
                ),
              )
            : Container(),
      ),
    );
  }
}
