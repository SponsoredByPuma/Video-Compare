import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/comparePage/compare_model.dart';
import 'package:myapp/comparePage/compare_view.dart';
import 'package:myapp/landingpage/landing_model.dart';
import 'package:myapp/landingpage/landing_view.dart';

import '../comparePage/compare_controller.dart';
import '../landingpage/landing_controller.dart';

final Providers providers = Providers();

class Providers {
  final StateNotifierProvider<CompareController, CompareModel>
      compareControllerProvider =
      StateNotifierProvider<CompareController, CompareModel>(
          (StateNotifierProviderRef ref) => CompareControllerImplmentation());

  final StateNotifierProvider<LandingController, LandingModel>
      landingControllerProvider =
      StateNotifierProvider<LandingController, LandingModel>(
          (StateNotifierProviderRef ref) => LandingControllerImplmentation());
}
