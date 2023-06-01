import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayButton extends StatefulWidget {
  final VideoPlayerController? firstVideoController;
  final VideoPlayerController? secondVideoController;

  const PlayButton({
    Key? key,
    required this.firstVideoController,
    required this.secondVideoController,
  }) : super(key: key);

  @override
  _PlayButtonState createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  bool _isPlaying = false;

  void _togglePlay() {
    setState(() {
      _isPlaying = !_isPlaying;
      if (_isPlaying) {
        widget.firstVideoController?.play();
        widget.secondVideoController?.play();
      } else {
        widget.firstVideoController?.pause();
        widget.secondVideoController?.pause();
      }
    });
  }

  void addWatcherToController() {
    if (widget.firstVideoController!.value.duration >=
        widget.secondVideoController!.value.duration) {
      widget.firstVideoController!.addListener(() {
        setState(() {
          if (widget.firstVideoController!.value.duration ==
              widget.firstVideoController!.value.position) {
            _isPlaying = false;
            widget.firstVideoController!.seekTo(Duration.zero);
            widget.secondVideoController!.seekTo(Duration.zero);
          }
        });
      });
    } else {
      widget.secondVideoController!.addListener(() {
        setState(() {
          if (widget.secondVideoController!.value.duration ==
              widget.secondVideoController!.value.position) {
            //setState(() {
            _isPlaying = false;
            widget.firstVideoController!.seekTo(Duration.zero);
            widget.secondVideoController!.seekTo(Duration.zero);
            //});
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isPlaying ? Icons.pause : Icons.play_arrow,
        size: 48,
        color: Theme.of(context).primaryColor,
      ),
      onPressed: () {
        addWatcherToController();
        _togglePlay();
      },
    );
  }
}
