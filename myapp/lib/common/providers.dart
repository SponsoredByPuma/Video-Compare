import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/home/home_model.dart';
import 'package:myapp/home/home_view.dart';

import '../home/home_controller.dart';

final Providers providers = Providers();

class Providers {
  final StateNotifierProvider<HomeController, HomeModel>
      homeControllerProvider = StateNotifierProvider<HomeController, HomeModel>(
          (StateNotifierProviderRef ref) => HomeControllerImplmentation());
}
