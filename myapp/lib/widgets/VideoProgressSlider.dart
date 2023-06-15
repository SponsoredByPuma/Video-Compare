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
      data: const SliderThemeData(
          activeTrackColor: Color.fromARGB(249, 161, 151, 10),
          inactiveTrackColor: Color.fromARGB(204, 14, 161, 117),
          //overlayColor: Color.fromARGB(150, 153, 32, 190),
          trackHeight: 14,
          thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: 12, pressedElevation: 10),
          thumbColor: Color.fromARGB(255, 0, 0, 0),
          trackShape: RectangularSliderTrackShape(),
          showValueIndicator: ShowValueIndicator.always,
          valueIndicatorColor: Colors.amber,
          valueIndicatorTextStyle: TextStyle(color: Colors.black)),
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
