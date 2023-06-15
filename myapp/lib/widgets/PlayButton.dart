import 'package:flutter/material.dart';
import 'package:myapp/home/home_view.dart';
import 'package:video_player/video_player.dart';

class PlayButton extends StatefulWidget {
  final VideoPlayerController? firstVideoController;
  final VideoPlayerController? secondVideoController;
  final Function() watcherFirstVideo;
  final Function() watcherSecondVideo;

  const PlayButton({
    Key? key,
    required this.firstVideoController,
    required this.secondVideoController,
    required this.watcherFirstVideo,
    required this.watcherSecondVideo,
  }) : super(key: key);

  @override
  _PlayButtonState createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  late bool _isPlaying;

  @override
  void initState() {
    super.initState();
    _isPlaying = widget.firstVideoController!.value.isPlaying ||
        widget.secondVideoController!.value.isPlaying;
  }

  @override
  void dispose() {
    widget.firstVideoController!.removeListener(widget.watcherFirstVideo());
    widget.secondVideoController!.removeListener(widget.watcherSecondVideo());
    super.dispose();
  }

  void addWatcherToController({
    required double firstVideoDuration,
    required double secondVideoDuration,
    required double secondVideoEndPoint,
    required double firstVideoEndPoint,
  }) {
    if (firstVideoDuration >= secondVideoDuration) {
      widget.firstVideoController!.addListener(widget.watcherFirstVideo());
    } else {
      widget.secondVideoController!.addListener(widget.watcherSecondVideo());
    }
  }

/*   void _watcherFirstVideo() {
    if (mounted) {
      setState(() {
        if (widget.firstVideoController!.value.position.inMilliseconds >=
            widget.homecontroller.getFirstVideoEnd().toInt()) {
          _isPlaying = false;
          widget.firstVideoController!.pause();
          widget.secondVideoController!.pause();
          widget.firstVideoController!.seekTo(
              Duration(milliseconds: widget.firstVideoStartPoint.toInt()));
          widget.secondVideoController!.seekTo(
              Duration(milliseconds: widget.secondVideoStartPoint.toInt()));
        } else if (widget.secondVideoController.value.position.inMilliseconds >=
            widget.homecontroller.getSecondVideoEnd().toInt()) {
          widget.secondVideoController.pause();
        }
      });
    }
  }

  void _watcherSecondVideo() {
    if (mounted) {
      setState(() {
        if (widget.secondVideoController!.value.position.inMilliseconds >=
            widget.homecontroller.getSecondVideoEnd().toInt()) {
          _isPlaying = false;
          widget.firstVideoController!.pause();
          widget.secondVideoController!.pause();
          widget.firstVideoController!.seekTo(
              Duration(milliseconds: widget.firstVideoStartPoint.toInt()));
          widget.secondVideoController!.seekTo(
              Duration(milliseconds: widget.secondVideoStartPoint.toInt()));
        } else if (widget.firstVideoController.value.position.inMilliseconds >=
            widget.homecontroller.getFirstVideoEnd().toInt()) {
          widget.firstVideoController.pause();
        }
      });
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isPlaying ? Icons.pause : Icons.play_arrow,
        size: 48,
        color: Theme.of(context).primaryColor,
      ),
      onPressed: () {
        setState(() {
          _isPlaying = !_isPlaying;
          if (_isPlaying) {
            widget.firstVideoController!.play();
            widget.secondVideoController!.play();
          } else {
            widget.firstVideoController!.pause();
            widget.secondVideoController!.pause();
          }
        });
      },
    );
  }
}
