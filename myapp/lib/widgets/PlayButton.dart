import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/home/home_view.dart';
import 'package:video_player/video_player.dart';

class PlayButton extends StatefulWidget {
  final VideoPlayerController firstVideoController;
  final VideoPlayerController secondVideoController;
  final double firstVideoStartPoint;
  final double firstVideoEndPoint;
  final double secondVideoStartPoint;
  final double secondVideoEndPoint;
  final HomeController homecontroller;

  const PlayButton({
    Key? key,
    required this.firstVideoController,
    required this.secondVideoController,
    required this.firstVideoStartPoint,
    required this.firstVideoEndPoint,
    required this.secondVideoStartPoint,
    required this.secondVideoEndPoint,
    required this.homecontroller,
  }) : super(key: key);

  @override
  _PlayButtonState createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  bool _togglePlay() {
    bool isPlaying = widget.firstVideoController.value.isPlaying ||
        widget.secondVideoController.value.isPlaying;
    setState(() {
      isPlaying = !isPlaying;
      if (isPlaying) {
        widget.firstVideoController.play();
        widget.secondVideoController.play();
      } else {
        widget.firstVideoController.pause();
        widget.secondVideoController.pause();
      }
    });
    return isPlaying;
  }

  void addWatcherToController({
    required double firstVideoDuration,
    required double secondVideoDuration,
    required double secondVideoEndPoint,
    required double firstVideoEndPoint,
  }) {
    if (firstVideoDuration >= secondVideoDuration) {
      widget.firstVideoController.addListener(
        () {
          if (firstVideoEndPoint <=
              widget.firstVideoController.value.position.inMilliseconds) {
            widget.firstVideoController.pause();
            widget.secondVideoController.pause();
            widget.firstVideoController.seekTo(
                Duration(milliseconds: widget.firstVideoStartPoint.toInt()));
            widget.secondVideoController.seekTo(
                Duration(milliseconds: widget.secondVideoStartPoint.toInt()));
          } else {
            if (secondVideoEndPoint <=
                widget.secondVideoController.value.position.inMilliseconds) {
              widget.secondVideoController.pause();
            }
          }
        },
      );
    } else {
      widget.secondVideoController.addListener(
        () {
          setState(
            () {
              if (secondVideoEndPoint <=
                  widget.secondVideoController.value.position.inMilliseconds) {
                widget.firstVideoController.pause();
                widget.secondVideoController.pause();
                widget.firstVideoController.seekTo(Duration(
                    milliseconds: widget.firstVideoStartPoint.toInt()));
                widget.secondVideoController.seekTo(Duration(
                    milliseconds: widget.secondVideoStartPoint.toInt()));
              } else {
                if (firstVideoEndPoint <=
                    widget.firstVideoController.value.position.inMilliseconds) {
                  widget.firstVideoController.pause();
                }
              }
            },
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double firstVideoDuration = widget.homecontroller.getFirstVideoEnd() -
        widget.homecontroller.getFirstVideoStart();
    double secondVideoDuration = widget.homecontroller.getSecondVideoEnd() -
        widget.homecontroller.getSecondVideoStart();

    addWatcherToController(
        firstVideoDuration: firstVideoDuration,
        secondVideoDuration: secondVideoDuration,
        firstVideoEndPoint: widget.homecontroller.getFirstVideoEnd(),
        secondVideoEndPoint: widget.homecontroller.getSecondVideoEnd());
    bool isPlaying = widget.firstVideoController.value.isPlaying ||
        widget.secondVideoController.value.isPlaying;

    return IconButton(
      icon: Icon(
        isPlaying ? Icons.pause : Icons.play_arrow,
        size: 48,
        color: Theme.of(context).primaryColor,
      ),
      onPressed: () {
        isPlaying = _togglePlay();
      },
    );
  }
}
