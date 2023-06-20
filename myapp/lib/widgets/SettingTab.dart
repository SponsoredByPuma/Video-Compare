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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Settings",
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 16),
              SwitchListTile(
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
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
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
            ],
          ),
        ),
      ],
    );
  }
}
