import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/home/home_model.dart';
import 'package:myapp/home/home_view.dart';
import 'package:myapp/landingpage/landing_model.dart';
import 'package:myapp/landingpage/landing_view.dart';


import '../home/home_controller.dart';
import '../landingpage/landing_controller.dart';

final Providers providers = Providers();

class Providers {
  final StateNotifierProvider<HomeController, HomeModel>
      homeControllerProvider = StateNotifierProvider<HomeController, HomeModel>(
          (StateNotifierProviderRef ref) => HomeControllerImplmentation());

  final StateNotifierProvider<LandingController, LandingModel>
      landingControllerProvider = StateNotifierProvider<LandingController, LandingModel>(
          (StateNotifierProviderRef ref) => LandingControllerImplmentation());

}
