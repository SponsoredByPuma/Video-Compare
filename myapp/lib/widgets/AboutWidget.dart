import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Align(
          alignment: Alignment(0, -0.85),
          child: Text(
            "Vison",
            style: TextStyle(fontSize: 26),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: Align(
            alignment: const Alignment(-0.9, -0.75),
            child: Text(
              AppLocalizations.of(context)?.aboutTheTeam ?? '',
              style: const TextStyle(fontSize: 26),
            ),
          ),
        ),
        Align(
          alignment: const Alignment(-0.8, -0.625),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              AppLocalizations.of(context)?.aboutTheTeamText ?? '',
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: Align(
            alignment: const Alignment(-0.9, -0.475),
            child: Text(
              AppLocalizations.of(context)?.aboutTheApp ?? '',
              style: const TextStyle(fontSize: 26),
            ),
          ),
        ),
        Align(
          alignment: const Alignment(-0.8, -0.35),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              AppLocalizations.of(context)?.aboutTheAppText ?? '',
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: Align(
            alignment: const Alignment(-0.9, -0.2),
            child: Text(
              AppLocalizations.of(context)?.aboutTheName ?? '',
              style: const TextStyle(fontSize: 26),
            ),
          ),
        ),
        Align(
          alignment: const Alignment(-0.8, -0.025),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              AppLocalizations.of(context)?.aboutTheNameText ?? '',
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ),
        Align(
          alignment: const Alignment(0, 0.8),
          child: Image.asset('assets/images/BisonTransparent.png',
              width: 300, height: 300),
        ),
      ],
    );
  }
}
