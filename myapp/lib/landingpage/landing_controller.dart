import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vison/landingpage/landing_model.dart';
import 'package:vison/landingpage/landing_view.dart';
import 'package:vison/comparePage/LanguageService.dart';

class LandingControllerImplmentation extends LandingController {
  final LanguageService _languageService = Get.find();
  LandingControllerImplmentation({
    LandingModel? model,
  }) : super((model ??
            const LandingModel(
              lightmode: true,
              currentLanguage: 'en',
            )));
  @override
  void changeLanguage(BuildContext context, String languageCode) {
    _languageService.changeLanguage(context, languageCode);
    state = state.copyWith(currentLanguage: _languageService.currentLanguage);
  }
}
