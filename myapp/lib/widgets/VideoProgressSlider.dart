import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoProgressSlider extends StatelessWidget {
  const VideoProgressSlider({
    super.key,
    required this.position,
    required this.duration,
    required this.controller,
    required this.swatch,
    required this.secondController,
    required this.getEndValue,
  });

  final Duration position;
  final Duration duration;
  final VideoPlayerController controller;
  final VideoPlayerController secondController;
  final Color swatch;
  final double Function() getEndValue;

  @override
  Widget build(BuildContext context) {
    final max = duration.inMilliseconds.toDouble();
    final value = position.inMilliseconds.clamp(0, max).toDouble();
    return SliderTheme(
      data: Theme.of(context).sliderTheme,
      child: Slider(
        min: 0,
        max: max,
        value: value,
        label: Duration(milliseconds: value.toInt()).toString(),
        onChanged: (value) => {
          controller.seekTo(Duration(milliseconds: value.toInt())),
          if (value >= getEndValue())
            {
              secondController
                  .seekTo(Duration(milliseconds: getEndValue().toInt())),
              secondController.pause(),
            }
          else
            {
              secondController.seekTo(Duration(milliseconds: value.toInt())),
              secondController.play(),
            }
        },
        onChangeStart: (_) => controller.pause(),
        onChangeEnd: (_) => controller.play(),
      ),
    );
  }
}
