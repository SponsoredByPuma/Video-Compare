import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:myapp/home/home_model.dart';
import 'package:myapp/home/home_view.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeControllerImplmentation extends HomeController {
  HomeControllerImplmentation({
    HomeModel? model,
  }) : super(model ??
            const HomeModel(
              vertical: true,
              lightmode: true,
              firstVideoController: null,
              secondVideoController: null,
              firstVideo: null,
              secondVideo: null,
              firstVideoTapped: false,
              secondVideoTapped: false,
              firstVideoStartPoint: 0.0,
              firstVideoEndPoint: 0.0,
              secondVideoStartPoint: 0.0,
              secondVideoEndPoint: 0.0,
              currentLanguage: 'en',
            ));
  @override
  void changeLanguage(BuildContext context, String languageCode) {
    if (AppLocalizations.of(context)?.localeName != languageCode) {
      Get.updateLocale(Locale(languageCode));
      state = state.copyWith(currentLanguage: languageCode);
    }
  }

  @override
  void rotate() {
    state = state.copyWith(vertical: !state.vertical);
  }

  @override
  void setFirstController(controller) {
    state = state.copyWith(firstVideoController: controller);
  }

  @override
  void setSecondController(controller) {
    state = state.copyWith(secondVideoController: controller);
  }

  @override
  void removeFirstVideo() {
    state = state.copyWith(firstVideoController: null);
  }

  @override
  void removeSecondVideo() {
    state = state.copyWith(secondVideoController: null);
  }

  @override
  bool getLightMode() {
    return state.lightmode;
  }

  @override
  void switchColorMode() {
    state = state.copyWith(lightmode: !state.lightmode);
  }

  @override
  void firstVideoTapped() {
    if (!state.secondVideoTapped) {
      state = state.copyWith(firstVideoTapped: !state.firstVideoTapped);
    }
  }

  @override
  void secondVideoTapped() {
    if (!state.firstVideoTapped) {
      state = state.copyWith(secondVideoTapped: !state.secondVideoTapped);
    }
  }

  @override
  void changeFirstVideoStartPoint(startPoint) {
    state = state.copyWith(firstVideoStartPoint: startPoint);
  }

  @override
  void changeFirstVideoEndPoint(endPoint) {
    state = state.copyWith(firstVideoEndPoint: endPoint);
  }

  @override
  void changeSecondVideoStartPoint(startPoint) {
    state = state.copyWith(secondVideoStartPoint: startPoint);
  }

  @override
  void changeSecondVideoEndPoint(endPoint) {
    state = state.copyWith(secondVideoEndPoint: endPoint);
  }

  @override
  double getFirstVideoStart() {
    return state.firstVideoStartPoint;
  }

  @override
  double getFirstVideoEnd() {
    return state.firstVideoEndPoint;
  }

  @override
  double getSecondVideoStart() {
    return state.secondVideoStartPoint;
  }

  @override
  double getSecondVideoEnd() {
    return state.secondVideoEndPoint;
  }
}
