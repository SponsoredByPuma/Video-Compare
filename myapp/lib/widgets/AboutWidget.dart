import 'package:flutter/material.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            color: Colors.white,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'About',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
                SizedBox(height: 16),
                Text(
                  'This is a sample app that allows you to compare videos.',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: 16),
                Text(
                  'Version 1.0.0',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
