import 'package:flutter/material.dart';

class controllButton extends StatelessWidget {
  final String text;

  const controllButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 48,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(text),
      ),
    );
  }
}