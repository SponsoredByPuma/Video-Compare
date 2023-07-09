import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({
    Key? key,
    required this.changeLanguage,
    required this.switchColorMode,
    required this.getLightmode,
    required this.currentLanguage,
  }) : super(key: key);

  final Function(String languageCode) changeLanguage;
  final Function() switchColorMode;
  final bool getLightmode;
  final String currentLanguage;

  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        const Align(
          alignment: Alignment(0, -0.85),
          child: Text(
            "Settings",
            style: TextStyle(fontSize: 26),
          ),
        ),
        Align(
          alignment: const Alignment(0, -0.65),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    AppLocalizations.of(context)?.toggleDarkmode ?? '',
                    style: const TextStyle(fontSize: 16),
                    maxLines: 1,
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 8.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(
                      () {
                        widget.switchColorMode();
                      },
                    );
                  },
                  icon: const Icon(Icons.dark_mode),
                  label: const Text("  "),
                ),
              ),
            ],
          ),
        ),
        widget.currentLanguage == 'en'
            ? Align(
                alignment: const Alignment(0, -0.45),
                child: Theme(
                  data: Theme.of(context),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText:
                          AppLocalizations.of(context)?.settingsLanguage ?? '',
                      border: const OutlineInputBorder(),
                    ),
                    value: "English",
                    onChanged: (value) {
                      setState(
                        () {
                          _selectedLanguage = value!;
                          if (_selectedLanguage == 'English') {
                            widget.changeLanguage('en');
                          } else if (_selectedLanguage == 'Deutsch') {
                            widget.changeLanguage('de');
                          }
                        },
                      );
                    },
                    items: const [
                      DropdownMenuItem(
                        value: 'English',
                        child: Text('English'),
                      ),
                      DropdownMenuItem(
                        value: 'Deutsch',
                        child: Text('Deutsch'),
                      ),
                    ],
                  ),
                ),
              )
            : Align(
                alignment: const Alignment(0, -0.45),
                child: Theme(
                  data: Theme.of(context),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText:
                          AppLocalizations.of(context)?.settingsLanguage ?? '',
                      border: const OutlineInputBorder(),
                    ),
                    value: "Deutsch",
                    onChanged: (value) {
                      setState(
                        () {
                          _selectedLanguage = value!;
                          if (_selectedLanguage == 'English') {
                            widget.changeLanguage('en');
                          } else if (_selectedLanguage == 'Deutsch') {
                            widget.changeLanguage('de');
                          }
                        },
                      );
                    },
                    items: const [
                      DropdownMenuItem(
                        value: 'English',
                        child: Text('English'),
                      ),
                      DropdownMenuItem(
                        value: 'Deutsch',
                        child: Text('Deutsch'),
                      ),
                    ],
                  ),
                ),
              ),
        Align(
          alignment: const Alignment(0, 1),
          child: Image.asset('assets/images/BisonTransparent.png',
              width: screenWidth * 0.8, height: screenWidth * 0.8),
        ),
      ],
    );
  }
}
