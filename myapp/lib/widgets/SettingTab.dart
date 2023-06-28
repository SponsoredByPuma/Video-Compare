import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SettingsTab extends StatefulWidget {
  const SettingsTab({
    Key? key,
    required this.changeLanguage,
    required this.switchColorMode,
    required this.getLightmode,
  }) : super(key: key);

  final Function(String languageCode) changeLanguage;
  final Function() switchColorMode;
  final bool getLightmode;


  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {

  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        AppLocalizations.of(context)?.toggleDarkmode ?? '',
                        style: TextStyle(fontSize: 16),
                        maxLines: 1,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0, left: 8.0),
                    child: ElevatedButton.icon(
                      onPressed: () {

                        setState(() {
                          widget.switchColorMode();

                        });

                      },
                      icon:
                           const Icon(Icons.dark_mode) ,
                      label: const Text(
                          "  "),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Theme(
                data: Theme.of(context),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: "Language",
                    border: OutlineInputBorder(),
                  ),
                  value: _selectedLanguage,
                  onChanged: (value) {
                    setState(() {
                      _selectedLanguage = value!;
                      if (_selectedLanguage == 'English') {
                        widget.changeLanguage('en');
                      } else if (_selectedLanguage == 'Deutsch') {
                        widget.changeLanguage('de');
                      }
                    });
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
            ],
          ),
        ),
      ],
    );
  }
}