import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum SampleItem { itemOne, itemTwo, itemThree, itemFour }

class SettingsMenu extends StatefulWidget {
  const SettingsMenu({
    Key? key,
    required this.themeSwitch,
    required this.newProject,
    required this.saveProject,
    required this.changeLanguage,
    required this.getLightmode,
  }) : super(key: key);

  final Function() themeSwitch;
  final Function() newProject;
  final Function() saveProject;
  final Function(String languageCode) changeLanguage;
  final bool getLightmode;

  @override
  State<StatefulWidget> createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu> {
  SampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PopupMenuButton<SampleItem>(
        icon: const Icon(Icons.more_horiz),
        iconSize: 48,
        initialValue: selectedMenu,
        onSelected: (SampleItem item) {
          setState(
            () {
              selectedMenu = item;
              if (selectedMenu == SampleItem.itemOne) {
                widget.themeSwitch();
              }
              if (selectedMenu == SampleItem.itemTwo) {
                widget.newProject();
              }
              if (selectedMenu == SampleItem.itemThree) {
                widget.saveProject();
              }
              if (selectedMenu == SampleItem.itemFour) {
                if (AppLocalizations.of(context)?.localeName == 'en') {
                  widget.changeLanguage('de');
                } else {
                  widget.changeLanguage('en');
                }
              }
            },
          );
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
          PopupMenuItem<SampleItem>(
            value: SampleItem.itemOne,
            child: widget.getLightmode
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)?.darkModeText ?? '',
                      ),
                      const Icon(Icons.brightness_2),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)?.lightModeText ?? '',
                      ),
                      const Icon(Icons.sunny),
                    ],
                  ),
          ),
          PopupMenuItem<SampleItem>(
            value: SampleItem.itemTwo,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)?.newProjectButtonText ?? '',
                ),
                const Icon(Icons.recycling),
              ],
            ),
          ),
          PopupMenuItem<SampleItem>(
            value: SampleItem.itemThree,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)?.saveProjectButtonText ?? '',
                ),
                const Icon(Icons.save),
              ],
            ),
          ),
          PopupMenuItem<SampleItem>(
            value: SampleItem.itemFour,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)?.languageSwitchButton ?? ''),
                const Icon(Icons.language),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
