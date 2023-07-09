import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService extends GetxController {
  bool isLightMode = Get.isDarkMode ? false : true;
  bool isDarkModeEnabled = Get.isDarkMode ? true : false;
  final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromRGBO(70, 158, 209, 1),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(70, 158, 209, 1),
      iconTheme: IconThemeData(color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 82, 224, 153),
      ),
    ),
    primaryColor: Colors.black,
    sliderTheme: const SliderThemeData(
      activeTrackColor: Color.fromARGB(248, 88, 10, 161),
      inactiveTrackColor: Color.fromARGB(204, 148, 10, 10),
      trackHeight: 14,
      thumbShape:
          RoundSliderThumbShape(enabledThumbRadius: 12, pressedElevation: 10),
      thumbColor: Color.fromARGB(255, 255, 255, 255),
      trackShape: RectangularSliderTrackShape(),
      showValueIndicator: ShowValueIndicator.always,
      valueIndicatorColor: Color.fromARGB(255, 0, 0, 0),
      valueIndicatorTextStyle:
          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
    ),
    primaryTextTheme: Typography(platform: TargetPlatform.iOS).black,
    textTheme: Typography(platform: TargetPlatform.iOS).black,
    canvasColor: Colors.white,
    popupMenuTheme: const PopupMenuThemeData(color: Colors.white),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.black, fontSize: 26),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,
      contentTextStyle: TextStyle(color: Colors.black, fontSize: 22),
    ),
  );

  final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 67, 13, 117),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 67, 13, 117),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 216, 99, 67),
      ),
    ),
    primaryColor: Colors.white,
    sliderTheme: const SliderThemeData(
      activeTrackColor: Color.fromARGB(249, 161, 151, 10),
      inactiveTrackColor: Color.fromARGB(204, 14, 161, 117),
      trackHeight: 14,
      thumbShape:
          RoundSliderThumbShape(enabledThumbRadius: 12, pressedElevation: 10),
      thumbColor: Color.fromARGB(255, 0, 0, 0),
      trackShape: RectangularSliderTrackShape(),
      showValueIndicator: ShowValueIndicator.always,
      valueIndicatorColor: Colors.amber,
      valueIndicatorTextStyle: TextStyle(color: Colors.black),
    ),
    primaryTextTheme: Typography(platform: TargetPlatform.iOS).white,
    textTheme: Typography(platform: TargetPlatform.iOS).white,
    canvasColor: Colors.black,
    popupMenuTheme: const PopupMenuThemeData(color: Colors.black),
    iconTheme: const IconThemeData(color: Colors.white),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.white, fontSize: 26),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,
      contentTextStyle: TextStyle(color: Colors.black, fontSize: 22),
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 24),
    ),
  );

  Future<void> switchTheme() async {
    isLightMode = !isLightMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLightMode', isLightMode);
    if (isLightMode) {
      Get.changeThemeMode(ThemeMode.light);
      isDarkModeEnabled = false;
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      isDarkModeEnabled = true;
    }
  }

  bool isDarkmodeOn() {
    return isDarkModeEnabled;
  }

  Future<void> setisLightModefromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final savedIsLightMode = prefs.getBool('isLightMode');
    if (savedIsLightMode != null) {
      isLightMode = savedIsLightMode;
      if (isLightMode) {
        Get.changeThemeMode(ThemeMode.light);
        isDarkModeEnabled = false;
      } else {
        Get.changeThemeMode(ThemeMode.dark);
        isDarkModeEnabled = true;
      }
    }
  }
}
