import 'package:flutter/material.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class SettingsMenu extends StatefulWidget {
  const SettingsMenu({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu> {
  SampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PopupMenuButton<SampleItem>(
        initialValue: selectedMenu,
        // Callback that sets the selected popup menu item.
        onSelected: (SampleItem item) {
          setState(() {
            selectedMenu = item;
          });
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
          const PopupMenuItem<SampleItem>(
            value: SampleItem.itemOne,
            child: Row(
              children: [
                Text("Darkmode    "),
                Icon(Icons.brightness_2, color: Colors.black),
              ],
            ),
          ),
          const PopupMenuItem<SampleItem>(
            value: SampleItem.itemTwo,
            child: Row(
              children: [
                Text("New Project    "),
                Icon(Icons.recycling, color: Colors.black),
              ],
            ),
          ),
          const PopupMenuItem<SampleItem>(
            value: SampleItem.itemThree,
            child: Row(
              children: [
                Text("Save    "),
                Icon(Icons.save, color: Colors.black),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
