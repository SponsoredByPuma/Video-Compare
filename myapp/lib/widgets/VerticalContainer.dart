import 'package:flutter/material.dart';
import 'package:myapp/home/home_view.dart';
import 'package:myapp/widgets/BorderedContainer.dart';
import 'package:myapp/widgets/PlayButton.dart';
import 'package:video_player/video_player.dart';

class VerticalContainer extends StatelessWidget {
  final Widget leftVideoController;
  final Widget rightVideoController;
  final VideoPlayerController? controllerLeft;
  final VideoPlayerController? controllerRight;
  final HomeController controller;

  final double firstVideoStartPoint;
  final double firstVideoEndPoint;
  final double secondVideoStartPoint;
  final double secondVideoEndPoint;

  const VerticalContainer({
    Key? key,
    required this.leftVideoController,
    required this.rightVideoController,
    required this.controllerLeft,
    required this.controllerRight,
    required this.controller,
    required this.firstVideoStartPoint,
    required this.firstVideoEndPoint,
    required this.secondVideoStartPoint,
    required this.secondVideoEndPoint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            Align(
              alignment: const Alignment(-1, 0),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                child: BorderedContainer(
                  vertical: true,
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
              alignment: const Alignment(1, 0),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                child: BorderedContainer(
                  vertical: true,
                  child: rightVideoController,
                ),
                onTap: () {
                  controller.secondVideoTapped();
                },
              ),
            ),
          ],
        ),
        controllerLeft != null && controllerRight != null
            ? Align(
                alignment: const Alignment(-0.04, 1),
                child: PlayButton(
                  firstVideoController: controllerLeft!,
                  secondVideoController: controllerRight!,
                  firstVideoStartPoint: firstVideoStartPoint,
                  firstVideoEndPoint: firstVideoEndPoint,
                  secondVideoStartPoint: secondVideoStartPoint,
                  secondVideoEndPoint: secondVideoEndPoint,
                  homecontroller: controller,
                ),
              )
            : const Center()
      ],
    );
  }
}
