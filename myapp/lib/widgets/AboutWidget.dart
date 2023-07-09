import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Align(
          alignment: const Alignment(0, -0.85),
          child: Text(
            "Vison",
            style: TextStyle(fontSize: screenWidth * 0.06),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
          child: Align(
            alignment: const Alignment(-0.9, -0.75),
            child: Text(
              AppLocalizations.of(context)?.aboutTheTeam ?? '',
              style: TextStyle(fontSize: screenWidth * 0.06),
            ),
          ),
        ),
        Align(
          alignment: const Alignment(-0.8, -0.625),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Text(
              AppLocalizations.of(context)?.aboutTheTeamText ?? '',
              style: TextStyle(fontSize: screenWidth * 0.03),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
          child: Align(
            alignment: const Alignment(-0.9, -0.475),
            child: Text(
              AppLocalizations.of(context)?.aboutTheApp ?? '',
              style: TextStyle(fontSize: screenWidth * 0.06),
            ),
          ),
        ),
        Align(
          alignment: const Alignment(-0.8, -0.35),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Text(
              AppLocalizations.of(context)?.aboutTheAppText ?? '',
              style: TextStyle(fontSize: screenWidth * 0.03),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
          child: Align(
            alignment: const Alignment(-0.9, -0.2),
            child: Text(
              AppLocalizations.of(context)?.aboutTheName ?? '',
              style: TextStyle(fontSize: screenWidth * 0.06),
            ),
          ),
        ),
        Align(
          alignment: const Alignment(-0.8, -0.025),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Text(
              AppLocalizations.of(context)?.aboutTheNameText ?? '',
              style: TextStyle(fontSize: screenWidth * 0.03),
            ),
          ),
        ),
        Align(
          alignment: const Alignment(0, 1),
          child: Image.asset('assets/images/BisonTransparent.png',
              width: screenWidth * 0.7, height: screenWidth * 0.7),
        ),
      ],
    );
  }
}
