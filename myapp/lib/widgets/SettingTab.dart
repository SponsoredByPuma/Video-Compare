import 'package:flutter/material.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({
    Key? key,
    required this.changeLanguage,
  }) : super(key: key);

  final Function(String languageCode) changeLanguage;

  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool _isDarkModeEnabled = false;
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
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
          child: SwitchListTile(
            title: const Text(
              "Darkmode",
            ),
            value: _isDarkModeEnabled,
            onChanged: (value) {
              setState(() {
                _isDarkModeEnabled = value;
                if (_isDarkModeEnabled) {
                  // Enable dark mode
                  // ...
                } else {
                  // Disable dark mode
                  // ...
                }
              });
            },
          ),
        ),
        Align(
          alignment: const Alignment(0, -0.45),
          child: Theme(
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
        ),
      ],
    );
  }
}
