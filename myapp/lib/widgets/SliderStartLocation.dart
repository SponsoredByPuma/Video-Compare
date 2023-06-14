import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:smooth_video_progress/smooth_video_progress.dart';

class SliderExample extends StatefulWidget {
  VideoPlayerController? firstVideoController;
  VideoPlayerController? secondVideoController;

  SliderExample({
    super.key,
    required this.firstVideoController,
    required this.secondVideoController,
  });

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  @override
  Widget build(BuildContext context) {
    return widget.firstVideoController!.value.duration >=
            widget.secondVideoController!.value.duration
        ? SmoothVideoProgress(
            controller: widget.firstVideoController!,
            builder: (context, position, duration, child) => Slider(
              onChangeStart: (_) => widget.firstVideoController!.pause(),
              onChangeEnd: (_) => widget.firstVideoController!.play(),
              onChanged: (double value) => {
                widget.firstVideoController!
                    .seekTo(Duration(milliseconds: value.toInt())),
                if (Duration(milliseconds: value.toInt()) >=
                    widget.secondVideoController!.value.duration)
                  {
                    widget.secondVideoController!
                        .seekTo(widget.secondVideoController!.value.duration),
                    widget.secondVideoController!.pause(),
                  }
                else
                  {
                    widget.secondVideoController!
                        .seekTo(Duration(milliseconds: value.toInt())),
                  }
              },
              value: position.inMilliseconds.toDouble(),
              min: 0,
              max: duration.inMilliseconds.toDouble(),
            ),
          )
        : SmoothVideoProgress(
            controller: widget.secondVideoController!,
            builder: (context, position, duration, child) => Slider(
              onChangeStart: (_) => widget.secondVideoController!.pause(),
              onChangeEnd: (_) => widget.secondVideoController!.play(),
              onChanged: (double value) => {
                widget.secondVideoController!
                    .seekTo(Duration(milliseconds: value.toInt())),
                if (Duration(milliseconds: value.toInt()) >=
                    widget.firstVideoController!.value.duration)
                  {
                    widget.firstVideoController!
                        .seekTo(widget.firstVideoController!.value.duration),
                    widget.firstVideoController!.pause(),
                  }
                else
                  {
                    widget.firstVideoController!
                        .seekTo(Duration(milliseconds: value.toInt())),
                  }
              },
              value: position.inMilliseconds.toDouble(),
              min: 0,
              max: duration.inMilliseconds.toDouble(),
            ),
          );
  }
}
