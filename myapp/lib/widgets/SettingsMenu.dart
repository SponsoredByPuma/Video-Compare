import 'package:flutter/material.dart';
import 'package:myapp/home/home_view.dart';
import 'package:myapp/main.dart';
import 'package:video_player/video_player.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class SettingsMenu extends StatefulWidget {
  SettingsMenu({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

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
          setState(
            () {
              selectedMenu = item;
              if (selectedMenu == SampleItem.itemOne) {
                // darkmode
              }
              if (selectedMenu == SampleItem.itemTwo) {
                // remove both videos inside the VideoPlayerController
                /*if (widget.firstVideoController != null) {
                  widget.firstVideoController = null;
                }
                if (widget.secondVideoController != null) {
                  widget.secondVideoController = null;
                } */
                widget.controller.removeFirstVideo();
                widget.controller.removeSecondVideo();
              }
              if (selectedMenu == SampleItem.itemThree) {
                //safe
              }
            },
          );
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
