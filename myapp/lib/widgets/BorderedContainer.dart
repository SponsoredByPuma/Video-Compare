import 'package:flutter/material.dart';

class BorderedContainer extends StatelessWidget {
  final Widget child;

  const BorderedContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        border: Border(
          left: BorderSide(
            color: Colors.white,
            width: 2,
          ),
          bottom: BorderSide(
            color: Colors.white,
            width: 2,
          ),
          top: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
      ),
      width: MediaQuery.of(context).size.width * 0.5,
      child: child,
    );
  }
}