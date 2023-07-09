import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayButton extends StatefulWidget {
  final VideoPlayerController? firstVideoController;
  final VideoPlayerController? secondVideoController;
  final double firstVideoStartPoint;
  final bool firstVideoIsLonger;
  final Function() watcherFirstVideo;
  final Function() watcherSecondVideo;

  const PlayButton({
    Key? key,
    required this.firstVideoController,
    required this.secondVideoController,
    required this.watcherFirstVideo,
    required this.watcherSecondVideo,
    required this.firstVideoStartPoint,
    required this.firstVideoIsLonger,
  }) : super(key: key);

  @override
  _PlayButtonState createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  late bool _isPlaying;
  late ValueNotifier<double> startFirstVideo;

  @override
  void initState() {
    super.initState();
    _isPlaying = widget.firstVideoController!.value.isPlaying ||
        widget.secondVideoController!.value.isPlaying;
    startFirstVideo = ValueNotifier(widget.firstVideoStartPoint);
    addWatcherToController(firstVideoIsLonger: widget.firstVideoIsLonger);
  }

  @override
  void dispose() {
    widget.firstVideoController!.removeListener(_watcherFirstVideo);
    widget.secondVideoController!.removeListener(_watcherSecondVideo);
    super.dispose();
  }

  void addWatcherToController({required bool firstVideoIsLonger}) {
    if (firstVideoIsLonger) {
      widget.firstVideoController!.addListener(_watcherFirstVideo);
    } else {
      widget.secondVideoController!.addListener(_watcherSecondVideo);
    }
  }

  void _watcherFirstVideo() {
    if (mounted) {
      setState(
        () {
          widget.watcherFirstVideo();
        },
      );
    }
  }

  void _watcherSecondVideo() {
    if (mounted) {
      setState(
        () {
          widget.watcherSecondVideo();
        },
      );
    }
  }

  rebuildComponent() {
    widget.firstVideoController!.removeListener(_watcherFirstVideo);
    widget.secondVideoController!.removeListener(_watcherSecondVideo);
    addWatcherToController(firstVideoIsLonger: widget.firstVideoIsLonger);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: startFirstVideo,
      builder: (BuildContext context, double startFirstVideo, Widget? child) {
        _isPlaying = widget.firstVideoController!.value.isPlaying ||
            widget.secondVideoController!.value.isPlaying;
        rebuildComponent();
        return IconButton(
          icon: Icon(
            _isPlaying ? Icons.pause : Icons.play_arrow,
            size: 48,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            setState(
              () {
                _isPlaying = !_isPlaying;
                if (_isPlaying) {
                  widget.firstVideoController!.play();
                  widget.secondVideoController!.play();
                } else {
                  widget.firstVideoController!.pause();
                  widget.secondVideoController!.pause();
                }
              },
            );
          },
        );
      },
    );
  }
}
