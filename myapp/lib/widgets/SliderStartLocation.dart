import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:smooth_video_progress/smooth_video_progress.dart';

class SliderExample extends StatefulWidget {
  final VideoPlayerController? firstVideoController;
  final VideoPlayerController? secondVideoController;
  final bool Function() firstVideoLonger;
  final double Function(String videoNumber) getStartValue;
  final double Function(String videoNumber) getEndValue;
  final double startVideoOne;

  const SliderExample({
    super.key,
    required this.firstVideoController,
    required this.secondVideoController,
    required this.firstVideoLonger,
    required this.getStartValue,
    required this.getEndValue,
    required this.startVideoOne,
  });

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  late ValueNotifier<double> startFirstVideo;

  @override
  void initState() {
    super.initState();
    startFirstVideo = ValueNotifier(widget.startVideoOne);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: startFirstVideo,
        builder: (BuildContext context, double startFirstVideo, Widget? child) {
          print("Updated <--");
          return widget.firstVideoLonger()
              ? SmoothVideoProgress(
                  controller: widget.firstVideoController!,
                  builder: (context, position, duration, child) => Slider(
                    onChangeStart: (_) => widget.firstVideoController!.pause(),
                    onChangeEnd: (_) => widget.firstVideoController!.play(),
                    onChanged: (double value) => {
                      if (value < widget.getEndValue("first"))
                        {
                          widget.firstVideoController!
                              .seekTo(Duration(milliseconds: value.toInt())),
                          if (value >= widget.getEndValue("second"))
                            {
                              widget.secondVideoController!.seekTo(Duration(
                                  milliseconds:
                                      widget.getEndValue("second").toInt())),
                              widget.secondVideoController!.pause(),
                            }
                          else
                            {
                              widget.secondVideoController!.seekTo(
                                  Duration(milliseconds: value.toInt())),
                            }
                        }
                    },

                    value: position.inMilliseconds.toDouble(),
                    min: widget.getStartValue("first"), //0
                    max: widget.getEndValue(
                        "first"), // duration.inMilliseconds.toDouble()
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
                      if (value >= widget.getEndValue("first"))
                        {
                          widget.firstVideoController!.seekTo(Duration(
                              milliseconds:
                                  widget.getEndValue("first").toInt())),
                          widget.firstVideoController!.pause(),
                        }
                      else
                        {
                          widget.firstVideoController!
                              .seekTo(Duration(milliseconds: value.toInt())),
                        }
                    },
                    value: position.inMilliseconds.toDouble(),
                    min: widget.getStartValue("second"),
                    max: widget.getEndValue("second"),
                  ),
                );
        });
  }
}
