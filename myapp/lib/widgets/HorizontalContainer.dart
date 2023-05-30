import 'package:flutter/material.dart';
import 'package:myapp/widgets/BorderedContainer.dart';

class HorizontalContainer extends StatelessWidget {
  final Widget leftVideoController;
  final Widget rightVideoController;

  const HorizontalContainer({
    Key? key,
    required this.leftVideoController,
    required this.rightVideoController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BorderedContainer(
          vertical: false,
          child: leftVideoController,
        ),
        BorderedContainer(
          vertical: false,
          child: rightVideoController,
        ),
      ],
    );
  }
}
