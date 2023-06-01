import 'package:flutter/material.dart';
import 'package:myapp/widgets/BorderedContainer.dart';

class VerticalContainer extends StatelessWidget {
  final Widget leftVideoController;
  final Widget rightVideoController;

  VerticalContainer({
    Key? key,
    required this.leftVideoController,
    required this.rightVideoController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BorderedContainer(
          vertical: true,
          child: leftVideoController,
        ),
        BorderedContainer(
          vertical: true,
          child: rightVideoController,
        ),
      ],
    );
  }
}
