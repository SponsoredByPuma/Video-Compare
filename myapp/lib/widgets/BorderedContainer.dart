import 'package:flutter/material.dart';

class BorderedContainer extends StatelessWidget {
  final Widget child;
  final bool vertical;
  final bool clicked;

  const BorderedContainer({
    Key? key,
    required this.child,
    required this.vertical,
    required this.clicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return vertical
        ? clicked
            ? Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey[300]!,
                      Colors.grey[400]!,
                      Colors.grey[500]!,
                      Colors.grey[600]!,
                      Colors.grey[700]!,
                      Colors.grey[800]!,
                      Colors.grey[900]!,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: const Border(
                    left: BorderSide(
                      color: Color.fromARGB(255, 216, 99, 67),
                      width: 4,
                    ),
                    right: BorderSide(
                      color: Color.fromARGB(255, 216, 99, 67),
                      width: 4,
                    ),
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 216, 99, 67),
                      width: 4,
                    ),
                    top: BorderSide(
                      color: Color.fromARGB(255, 216, 99, 67),
                      width: 4,
                    ),
                  ),
                ),
                width: MediaQuery.of(context).size.width * 0.5,
                child: Stack(
                  children: [
                    Align(alignment: Alignment.center, child: child),
                  ],
                ),
              )
            : Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey[300]!,
                      Colors.grey[400]!,
                      Colors.grey[500]!,
                      Colors.grey[600]!,
                      Colors.grey[700]!,
                      Colors.grey[800]!,
                      Colors.grey[900]!,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: const Border(
                    left: BorderSide(
                      color: Colors.white,
                      width: 4,
                    ),
                    right: BorderSide(
                      color: Colors.white,
                      width: 4,
                    ),
                    bottom: BorderSide(
                      color: Colors.white,
                      width: 4,
                    ),
                    top: BorderSide(
                      color: Colors.white,
                      width: 4,
                    ),
                  ),
                ),
                width: MediaQuery.of(context).size.width * 0.5,
                child: Stack(
                  children: [
                    Align(alignment: Alignment.center, child: child),
                  ],
                ),
              )
        : clicked
            ? Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey[300]!,
                      Colors.grey[400]!,
                      Colors.grey[500]!,
                      Colors.grey[600]!,
                      Colors.grey[700]!,
                      Colors.grey[800]!,
                      Colors.grey[900]!,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: const Border(
                    left: BorderSide(
                      color: Color.fromARGB(255, 216, 99, 67),
                      width: 4,
                    ),
                    right: BorderSide(
                      color: Color.fromARGB(255, 216, 99, 67),
                      width: 4,
                    ),
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 216, 99, 67),
                      width: 4,
                    ),
                    top: BorderSide(
                      color: Color.fromARGB(255, 216, 99, 67),
                      width: 4,
                    ),
                  ),
                ),
                child: Stack(
                  children: [
                    Align(alignment: Alignment.center, child: child),
                  ],
                ),
              )
            : Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey[300]!,
                      Colors.grey[400]!,
                      Colors.grey[500]!,
                      Colors.grey[600]!,
                      Colors.grey[700]!,
                      Colors.grey[800]!,
                      Colors.grey[900]!,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: const Border(
                    left: BorderSide(
                      color: Colors.white,
                      width: 4,
                    ),
                    right: BorderSide(
                      color: Colors.white,
                      width: 4,
                    ),
                    bottom: BorderSide(
                      color: Colors.white,
                      width: 4,
                    ),
                    top: BorderSide(
                      color: Colors.white,
                      width: 4,
                    ),
                  ),
                ),
                child: Stack(
                  children: [
                    Align(alignment: Alignment.center, child: child),
                  ],
                ),
              );
  }
}
