import 'package:flutter/material.dart';

class RotateButton extends StatefulWidget {
  final VoidCallback buttonPressed;
  const RotateButton({
    Key? key,
    required this.buttonPressed,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RotateButtonState();
}

class _RotateButtonState extends State<RotateButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 48,
      child: ElevatedButton(
        onPressed: widget.buttonPressed,
        child: const Text("Rotate"),
      ),
    );
  }
}
