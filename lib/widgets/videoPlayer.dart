import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;

  @override
  void initState() {
    //初始化controller
    _controller = VideoPlayerController.network(
      'http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4',
    );
    super.initState();
  }

  @override
  void dispose() {
    //銷毀controller
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.initialize();
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AspectRatio(
            //影片呈現等比例樣子
            aspectRatio: 16 / 9,
            child: VideoPlayer(_controller),
          ),
          FloatingActionButton(
            //播放按鈕
            backgroundColor: Colors.white24,
            elevation: 0, //shadow default
            highlightElevation: 0, //shadow click
            onPressed: () {
              //設定點擊狀態
              setState(() {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  _controller.play();
                }
              });
            },
            child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
          ),
        ],
      )),
    );
  }
}
