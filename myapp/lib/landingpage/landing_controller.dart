import 'package:myapp/home/home_model.dart';
import 'package:myapp/landingpage/landing_model.dart';
import 'package:myapp/landingpage/landing_view.dart';



class LandingControllerImplmentation extends LandingController{
  LandingControllerImplmentation({
    LandingModel? model,
  }) : super((model ??
            const LandingModel(
              lightmode: true,
            )));

}
