import 'package:flutter/material.dart';
import 'package:myapp/widgets/BorderedContainer.dart';

class VerticalContainer extends StatelessWidget {
  final Widget leftVideoController;
  final Widget rightVideoController;
  final VideoPlayerController? controllerLeft;
  final VideoPlayerController? controllerRight;

  const VerticalContainer({
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
        BorderedContainer(
          vertical: true,
          child: leftVideoController,
        ),
        Align(
          alignment: const Alignment(1, 0),
          child: BorderedContainer(
            vertical: true,
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
