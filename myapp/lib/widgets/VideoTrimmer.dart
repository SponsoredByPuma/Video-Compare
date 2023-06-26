import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_trimmer/video_trimmer.dart';
import 'package:video_player/video_player.dart';

class VideoTrimmer extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool isItFirstVideo;
  final Function(double value) videoStartPoint;
  final Function(double value) videoEndPoint;

  const VideoTrimmer({
    super.key,
    required this.videoPlayerController,
    required this.isItFirstVideo,
    required this.videoStartPoint,
    required this.videoEndPoint,
  });

  @override
  _VideoTrimmerState createState() => _VideoTrimmerState();
}

class _VideoTrimmerState extends State<VideoTrimmer> {
  final Trimmer _trimmer = Trimmer();

  saveVideos() async {
    _trimmer.saveTrimmedVideo(startValue: 0, endValue: 10, onSave: (String) {});
  }

  _loadVideo() async {
    final uriString = widget.videoPlayerController.dataSource;
    final uri = Uri.parse(uriString);
    final file = File.fromUri(uri);
    await _trimmer.loadVideo(videoFile: file);
  }

  @override
  void initState() {
    _loadVideo();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding (
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TrimViewer(
      trimmer: _trimmer,
      viewerHeight: 50.0,
      viewerWidth: double.infinity,
      maxVideoLength: widget.videoPlayerController.value.duration,
      onChangePlaybackState: (bool value) => {},
      showDuration: false,
      editorProperties: const TrimEditorProperties(
        borderPaintColor: Color.fromARGB(255, 172, 19, 39),
        borderWidth: 6,
        circleSize: 10,
        circlePaintColor: Color.fromARGB(255, 67, 203, 244),
        circleSizeOnDrag: 12,
        borderRadius: 12,
      ),
      onChangeStart: (double value) => {
        widget.videoStartPoint(value),
        if (widget.isItFirstVideo)
          {
            widget.videoPlayerController
                .seekTo(Duration(milliseconds: value.toInt())),
          }
        else
          {
            widget.videoPlayerController
                .seekTo(Duration(milliseconds: value.toInt())),
          }
      },
      onChangeEnd: (double value) => {
        widget.videoEndPoint(value),
        /*
        if (widget.isItFirstVideo)
          {
            widget.videoPlayerController
                .seekTo(Duration(milliseconds: value.toInt())),
          }
        else
          {
            widget.videoPlayerController
                .seekTo(Duration(milliseconds: value.toInt())),
          }
          */
      },
    )
    );
  }
}
