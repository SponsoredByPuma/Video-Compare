import 'package:flutter/material.dart';

class RotateButton extends StatefulWidget {
  const RotateButton({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RotateButtonState();
}

class _RotateButtonState extends State<RotateButton> {
  bool horizontal = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            horizontal = !horizontal;
          });
        },
        child: const Text("Rotate"),
      ),
    );
  }
}
