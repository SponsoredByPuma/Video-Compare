import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

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
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return widget.firstVideoController!.value.duration >=
            widget.secondVideoController!.value.duration
        ? Slider(
            value: widget.firstVideoController!.value.position.inSeconds
                .toDouble(),
            max: double.parse(
              widget.firstVideoController!.value.duration.inSeconds.toString(),
            ),
            onChanged: (double value) {
              setState(
                () {
                  _currentSliderValue = value;
                  widget.firstVideoController!
                      .seekTo(Duration(seconds: value.toInt()));
                  if (Duration(seconds: value.toInt()) >=
                      widget.secondVideoController!.value.duration) {
                    widget.secondVideoController!
                        .seekTo(widget.secondVideoController!.value.duration);
                    widget.secondVideoController!.pause();
                  } else {
                    widget.secondVideoController!
                        .seekTo(Duration(seconds: value.toInt()));
                  }
                },
              );
            },
            activeColor: Colors.white,
          )
        : Slider(
            value: _currentSliderValue,
            max: double.parse(
              widget.secondVideoController!.value.duration.inSeconds.toString(),
            ),
            onChanged: (double value) {
              setState(
                () {
                  _currentSliderValue = value;
                  widget.secondVideoController!
                      .seekTo(Duration(seconds: value.toInt()));
                  if (Duration(seconds: value.toInt()) >=
                      widget.firstVideoController!.value.duration) {
                    widget.secondVideoController!
                        .seekTo(widget.firstVideoController!.value.duration);
                    widget.secondVideoController!.pause();
                  } else {
                    widget.firstVideoController!
                        .seekTo(Duration(seconds: value.toInt()));
                  }
                },
              );
            },
          );
  }
}
