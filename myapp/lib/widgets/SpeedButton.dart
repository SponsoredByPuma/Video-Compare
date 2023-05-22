import 'package:flutter/material.dart';

class SpeedButton extends StatefulWidget {
  const SpeedButton({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SpeedButtonState();
}

class _SpeedButtonState extends State<SpeedButton> {
  String text = "Slow Down";
  bool slowed = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            slowed = !slowed;
            if (text == "Slow Down") {
              text = "Speed Up";
            } else {
              text = "Slow Down";
            }
          });
        },
        child: Text(text),
      ),
    );
  }
}
