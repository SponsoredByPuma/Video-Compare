import 'package:flutter/material.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({Key? key}) : super(key: key);

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
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Settings",
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
                const SizedBox(height: 16),
                SwitchListTile(
                  title: const Text("Darkmode"),
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
                        // switch to english
                      } else if (_selectedLanguage == 'German') {
                        // Switch to German
                        // ...
                      }
                    });
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 'English',
                      child: Text('English'),
                    ),
                    DropdownMenuItem(
                      value: 'Spanish',
                      child: Text('Spanish'),
                    ),
                    DropdownMenuItem(
                      value: 'French',
                      child: Text('French'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
