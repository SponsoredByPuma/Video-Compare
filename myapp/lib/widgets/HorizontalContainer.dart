import 'package:flutter/material.dart';
import 'package:myapp/home/home_view.dart';
import 'package:myapp/widgets/BorderedContainer.dart';
import 'package:myapp/widgets/PlayButton.dart';
import 'package:video_player/video_player.dart';

class HorizontalContainer extends StatelessWidget {
  final Widget leftVideoController;
  final Widget rightVideoController;
  final VideoPlayerController? controllerLeft;
  final VideoPlayerController? controllerRight;
  final HomeController controller;

  const HorizontalContainer({
    Key? key,
    required this.leftVideoController,
    required this.rightVideoController,
    required this.controllerLeft,
    required this.controllerRight,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            Align(
              alignment: const Alignment(1, -1),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                child: BorderedContainer(
                  vertical: false,
                  child: leftVideoController,
                ),
                onTap: () {
                  controller.firstVideoTapped();
                },
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Align(
              alignment: const Alignment(-1, 1),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                child: BorderedContainer(
                  vertical: false,
                  child: rightVideoController,
                ),
                onTap: () {
                  controller.secondVideoTapped();
                },
              ),
            ),
          ],
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
