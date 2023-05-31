import 'package:flutter/material.dart';
import 'package:myapp/widgets/BorderedContainer.dart';
import 'package:myapp/widgets/PlayButton.dart';
import 'package:video_player/video_player.dart';

class HorizontalContainer extends StatelessWidget {
  final Widget leftVideoController;
  final Widget rightVideoController;
  final VideoPlayerController? controllerLeft;
  final VideoPlayerController? controllerRight;

  const HorizontalContainer({
    Key? key,
    required this.leftVideoController,
    required this.rightVideoController,
    required this.controllerLeft,
    required this.controllerRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: const Alignment(1, -1),
          child: BorderedContainer(
            vertical: false,
            child: leftVideoController,
          ),
        ),
        Align(
          alignment: const Alignment(-1, 1),
          child: BorderedContainer(
            vertical: false,
            child: rightVideoController,
          ),
        ),
        Align(
          alignment: const Alignment(-0.04, 1),
          child: PlayButton(
            firstVideoController: controllerLeft,
            secondVideoController: controllerRight,
          ),
        ),
      ],
    );
  }
}
