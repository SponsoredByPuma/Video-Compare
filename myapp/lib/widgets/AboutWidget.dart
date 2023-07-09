import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.01),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)?.aboutTheTeam ?? '',
                style: TextStyle(fontSize: screenWidth * 0.06),
              ),
              SizedBox(width: screenWidth * 0.05),
              Text(
                AppLocalizations.of(context)?.aboutTheTeamText ?? '',
                style: TextStyle(fontSize: screenWidth * 0.03),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.01),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)?.aboutTheApp ?? '',
                style: TextStyle(fontSize: screenWidth * 0.06),
              ),
              SizedBox(width: screenWidth * 0.05),
              Text(
                AppLocalizations.of(context)?.aboutTheAppText ?? '',
                style: TextStyle(fontSize: screenWidth * 0.03),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.01),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)?.aboutTheName ?? '',
                style: TextStyle(fontSize: screenWidth * 0.06),
              ),
              SizedBox(width: screenWidth * 0.05),
              Text(
                AppLocalizations.of(context)?.aboutTheNameText ?? '',
                style: TextStyle(fontSize: screenWidth * 0.03),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.01),
      Align(
        alignment: const Alignment(0, 1),
        child: Image.asset('assets/images/BisonTransparent.png',
            width: screenWidth * 0.5, height: screenWidth * 0.5),
      ),

        ],
      ),
    );
  }
}