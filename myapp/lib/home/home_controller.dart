import 'package:myapp/home/home_model.dart';
import 'package:myapp/home/home_view.dart';

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
                secondVideo: null));

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
}
