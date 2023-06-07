import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/home/home_view.dart';
import 'package:video_trimmer/video_trimmer.dart';
import 'package:video_player/video_player.dart';

class VideoTrimmer extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final HomeController controller;
  final bool isItFirstVideo;

  const VideoTrimmer(
      {super.key,
      required this.controller,
      required this.videoPlayerController,
      required this.isItFirstVideo});

  @override
  _VideoTrimmerState createState() => _VideoTrimmerState();
}

class _VideoTrimmerState extends State<VideoTrimmer> {
  final Trimmer _trimmer = Trimmer();

  Future<void> _loadVideo() async {
    final uriString = widget.videoPlayerController.dataSource;
    final uri = Uri.parse(uriString);
    final file = File.fromUri(uri);
    await _trimmer.loadVideo(videoFile: file);
  }

  @override
  void initState() {
    super.initState();
    _loadVideo();
  }

  @override
  Widget build(BuildContext context) {
    return TrimViewer(
      trimmer: _trimmer,
      viewerHeight: 50.0,
      viewerWidth: 400,
      maxVideoLength: widget.videoPlayerController.value.duration,
      onChangeStart: (value) => {
        if (widget.isItFirstVideo)
          {
            widget.controller.changeFirstVideoStartPoint(value),
            widget.videoPlayerController
                .seekTo(Duration(milliseconds: value.toInt())),
          }
        else
          {
            widget.controller.changeSecondVideoStartPoint(value),
            widget.videoPlayerController
                .seekTo(Duration(milliseconds: value.toInt())),
          }
      },
      onChangeEnd: (value) => {
        if (widget.isItFirstVideo)
          {
            widget.controller.changeFirstVideoEndPoint(value),
            widget.videoPlayerController
                .seekTo(Duration(milliseconds: value.toInt())),
          }
        else
          {
            widget.controller.changeSecondVideoEndPoint(value),
            widget.videoPlayerController
                .seekTo(Duration(milliseconds: value.toInt())),
          }
      },
    );
  }
}
