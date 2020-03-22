import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoPlayer extends StatefulWidget {
  final String videoUrl;
  final num aspectRatioX;
  final num aspectRatioY;
  final bool autoPlay;
  final bool looping;
  VideoPlayer({
    @required this.videoUrl,
    @required this.aspectRatioX,
    @required this.aspectRatioY,
    this.autoPlay = false,
    this.looping = false,
  });
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  var videoPlayerController;
  var chewieController;

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: widget.aspectRatioX / widget.aspectRatioY,
      autoPlay: widget.autoPlay,
      looping: widget.looping,
      autoInitialize: true,
    );
    return Chewie(
      controller: chewieController,
    );
  }
}
