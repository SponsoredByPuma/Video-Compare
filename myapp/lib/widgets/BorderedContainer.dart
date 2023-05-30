import 'package:flutter/material.dart';

class BorderedContainer extends StatelessWidget {
  final Widget child;
  final bool vertical;

  const BorderedContainer(
      {Key? key, required this.child, required this.vertical})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return vertical
        ? Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.black,
              border: Border(
                left: BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
                right: BorderSide(
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
            child: Stack(
              children: [Align(alignment: Alignment.center, child: child)],
            ),
          )
        : Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.width * 0.64,
            decoration: const BoxDecoration(
              color: Colors.black,
              border: Border(
                left: BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
                right: BorderSide(
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
            //
            child: Stack(
              children: [Align(alignment: Alignment.center, child: child)],
            ),
          );
  }
}
