import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.lightGreen,
        border: Border.all(
          color: Colors.white,
          width: 5,
        ),
      ),
      width: MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(context).size.width * 0.25,
      child: IconButton(
        icon: const Icon(Icons.add),
        iconSize: 48,
        onPressed: onPressed,
      ),
    );
  }
}