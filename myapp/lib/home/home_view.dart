import 'package:myapp/widgets/RotateButton.dart';
import 'package:myapp/widgets/SettingsMenu.dart';
import 'package:myapp/widgets/SpeedButton.dart';
import 'package:myapp/widgets/VideoChooser.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/common/providers.dart';
import 'package:myapp/home/home_model.dart';
import 'package:myapp/widgets/HorizontalContainer.dart';
import 'package:myapp/widgets/VerticalContainer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:myapp/widgets/VideoTrimmer.dart';
import 'package:myapp/home/LanguageService.dart';
import 'package:myapp/home/LanguageService.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeController controller =
        ref.read(providers.homeControllerProvider.notifier);
    final HomeModel model = ref.watch(providers.homeControllerProvider);

    Widget horizontalConainer = HorizontalContainer(
      //First Controller
      leftVideoController: VideoChooserButton(
        controller: model.firstVideoController,
        video: model.firstVideo,
        onVideoSelected: (newController) {
          controller.setFirstController(newController);
          controller.changeFirstVideoStartPoint(0.0);
          controller.changeFirstVideoEndPoint(
              newController.value.duration.inSeconds.toDouble());
        },
      ),
      // Second Controller
      rightVideoController: VideoChooserButton(
        controller: model.secondVideoController,
        video: model.secondVideo,
        onVideoSelected: (newController) {
          controller.setSecondController(newController);
          controller.changeSecondVideoStartPoint(0.0);
          controller.changeSecondVideoEndPoint(
              newController.value.duration.inSeconds.toDouble());
        },
      ),
      // additional controller
      controllerLeft: model.firstVideoController,
      controllerRight: model.secondVideoController,
      controller: controller,
      // start & end points
      firstVideoStartPoint: model.firstVideoStartPoint,
      firstVideoEndPoint: model.firstVideoEndPoint,
      secondVideoStartPoint: model.secondVideoStartPoint,
      secondVideoEndPoint: model.secondVideoEndPoint,
    );

    Widget verticalContainer = VerticalContainer(
      //First Controller
      leftVideoController: VideoChooserButton(
        controller: model.firstVideoController,
        video: model.firstVideo,
        onVideoSelected: (newController) {
          controller.setFirstController(newController);
          controller.changeFirstVideoStartPoint(0.0);
          controller.changeFirstVideoEndPoint(
              newController.value.duration.inMilliseconds.toDouble());
        },
      ),
      // Second Controller
      rightVideoController: VideoChooserButton(
        controller: model.secondVideoController,
        video: model.secondVideo,
        onVideoSelected: (newController) {
          controller.setSecondController(newController);
          controller.changeSecondVideoStartPoint(0.0);
          controller.changeSecondVideoEndPoint(
              newController.value.duration.inMilliseconds.toDouble());
        },
      ),
      // additional controller
      controllerLeft: model.firstVideoController,
      controllerRight: model.secondVideoController,
      controller: controller,
      //start & endPoints
      firstVideoStartPoint: model.firstVideoStartPoint,
      firstVideoEndPoint: model.firstVideoEndPoint,
      secondVideoStartPoint: model.secondVideoStartPoint,
      secondVideoEndPoint: model.secondVideoEndPoint,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.apptitle ?? ''),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: 48,
          onPressed: () {
            //navigate back to landingpage
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          SettingsMenu(
            controller: controller,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                        child: model.vertical
                            ? verticalContainer
                            : horizontalConainer,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: (model.firstVideoController != null &&
                            model.secondVideoController != null)
                        ? Column(
                            children: [
                              // Slider
                              model.firstVideoTapped &&
                                      model.firstVideoController != null
                                  ? VideoTrimmer(
                                      controller: controller,
                                      videoPlayerController:
                                          model.firstVideoController!,
                                      isItFirstVideo: true,
                                    )
                                  : const Center(),
                              model.secondVideoTapped &&
                                      model.secondVideoController != null
                                  ? VideoTrimmer(
                                      controller: controller,
                                      videoPlayerController:
                                          model.secondVideoController!,
                                      isItFirstVideo: false,
                                    )
                                  : const Center(),
                            ],
                          )
                        : const Center(),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SpeedButton(
                        firstVideoController: model.firstVideoController,
                        secondVideoController: model.secondVideoController,
                      ),
                      RotateButton(buttonPressed: () => {controller.rotate()}),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

abstract class HomeController extends StateNotifier<HomeModel> {
  HomeController(HomeModel state) : super(state);

  void rotate();

  void setFirstController(controller);

  void setSecondController(controller);

  bool getLightMode();

  void switchColorMode();

  void firstVideoTapped();

  void secondVideoTapped();

  void changeFirstVideoStartPoint(startPoint);

  void changeFirstVideoEndPoint(endPoint);

  void changeSecondVideoStartPoint(startPoint);

  void changeSecondVideoEndPoint(endPoint);

  void changeLanguage(BuildContext context, String languageCode);

  double getFirstVideoStart();

  double getFirstVideoEnd();

  double getSecondVideoStart();

  double getSecondVideoEnd();

  void resetEverything();
}
