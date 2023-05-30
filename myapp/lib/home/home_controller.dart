import 'package:myapp/home/home_model.dart';
import 'package:myapp/home/home_view.dart';

class HomeControllerImplmentation extends HomeController {
  HomeControllerImplmentation({
    HomeModel? model,
  }) : super(model ?? const HomeModel(vertical: true));

  @override
  void rotate() {
    state = state.copyWith(vertical: !state.vertical);
  }
}
