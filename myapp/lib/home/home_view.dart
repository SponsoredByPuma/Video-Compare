import 'package:flutter/cupertino.dart';
import 'package:myapp/widgets/PlayButton.dart';
import 'package:myapp/widgets/RotateButton.dart';
import 'package:myapp/widgets/SavingWidget.dart';
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
import 'package:myapp/widgets/VideoProgressSlider.dart';
import 'package:myapp/widgets/VideoTrimmer.dart';
import 'package:get/get.dart';
import 'package:smooth_video_progress/smooth_video_progress.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

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
        onVideoSelected: (VideoPlayerController newController, File video) {
          controller.setFirstController(newController);
          controller.changeFirstVideoStartPoint(0.0);
          controller.changeFirstVideoEndPoint(
              newController.value.duration.inSeconds.toDouble());
          controller.setFirstVideo(video);
        },
      ),
      // Second Controller
      rightVideoController: VideoChooserButton(
        controller: model.secondVideoController,
        video: model.secondVideo,
        onVideoSelected: (VideoPlayerController newController, File video) {
          controller.setSecondController(newController);
          controller.changeSecondVideoStartPoint(0.0);
          controller.changeSecondVideoEndPoint(
              newController.value.duration.inSeconds.toDouble());
          controller.setSecondVideo(video);
        },
      ),
      // additional controller
      controllerLeft: model.firstVideoController,
      controllerRight: model.secondVideoController,
      firstContainerTapped: () {
        controller.firstVideoTapped();
      },
      secondContainerTapped: () {
        controller.secondVideoTapped();
      },
      playButton: PlayButton(
        firstVideoController: model.firstVideoController,
        secondVideoController: model.secondVideoController,
        watcherFirstVideo: () {
          if (model.firstVideoController!.value.position.inMilliseconds >=
              controller.getFirstVideoEnd().toInt()) {
            //_isPlaying = false;
            model.firstVideoController!.pause();
            model.secondVideoController!.pause();
            model.firstVideoController!.seekTo(
                Duration(milliseconds: model.firstVideoStartPoint.toInt()));
            model.secondVideoController!.seekTo(
                Duration(milliseconds: model.secondVideoStartPoint.toInt()));
          } else if (model
                  .secondVideoController!.value.position.inMilliseconds >=
              controller.getSecondVideoEnd().toInt()) {
            model.secondVideoController!.pause();
          }
        },
        watcherSecondVideo: () {
          if (model.secondVideoController!.value.position.inMilliseconds >=
              controller.getSecondVideoEnd().toInt()) {
            //_isPlaying = false;
            model.secondVideoController!.pause();
            model.firstVideoController!.pause();
            model.secondVideoController!.seekTo(
                Duration(milliseconds: model.secondVideoStartPoint.toInt()));
            model.firstVideoController!.seekTo(
                Duration(milliseconds: model.firstVideoStartPoint.toInt()));
          } else if (model
                  .firstVideoController!.value.position.inMilliseconds >=
              controller.getFirstVideoEnd().toInt()) {
            model.firstVideoController!.pause();
          }
        },
        firstVideoStartPoint: model.firstVideoStartPoint,
        firstVideoIsLonger:
            (model.firstVideoEndPoint - model.firstVideoStartPoint) >=
                (model.secondVideoEndPoint - model.secondVideoStartPoint),
      ),
    );

    Widget verticalContainer = VerticalContainer(
      //First Controller
      leftVideoController: VideoChooserButton(
        controller: model.firstVideoController,
        video: model.firstVideo,
        onVideoSelected: (VideoPlayerController newController, File video) {
          controller.setFirstController(newController);
          controller.changeFirstVideoStartPoint(0.0);
          controller.changeFirstVideoEndPoint(
              newController.value.duration.inMilliseconds.toDouble());
          controller.setFirstVideo(video);
        },
      ),
      // Second Controller
      rightVideoController: VideoChooserButton(
        controller: model.secondVideoController,
        video: model.secondVideo,
        onVideoSelected: (VideoPlayerController newController, File video) {
          controller.setSecondController(newController);
          controller.changeSecondVideoStartPoint(0.0);
          controller.changeSecondVideoEndPoint(
              newController.value.duration.inMilliseconds.toDouble());
          controller.setSecondVideo(video);
        },
      ),
      // additional controller
      controllerLeft: model.firstVideoController,
      controllerRight: model.secondVideoController,
      firstContainerTapped: () {
        controller.firstVideoTapped();
      },
      secondContainerTapped: () {
        controller.secondVideoTapped();
      },
      playButton: PlayButton(
        firstVideoController: model.firstVideoController,
        secondVideoController: model.secondVideoController,
        watcherFirstVideo: () {
          if (model.firstVideoController!.value.position.inMilliseconds >=
              controller.getFirstVideoEnd().toInt()) {
            model.firstVideoController!.pause();
            model.secondVideoController!.pause();
            model.firstVideoController!.seekTo(
                Duration(milliseconds: model.firstVideoStartPoint.toInt()));
            model.secondVideoController!.seekTo(
                Duration(milliseconds: model.secondVideoStartPoint.toInt()));
          } else if (model
                  .secondVideoController!.value.position.inMilliseconds >=
              controller.getSecondVideoEnd().toInt()) {
            model.secondVideoController!.pause();
          }
        },
        watcherSecondVideo: () {
          if (model.secondVideoController!.value.position.inMilliseconds >=
              controller.getSecondVideoEnd().toInt()) {
            model.secondVideoController!.pause();
            model.firstVideoController!.pause();
            model.secondVideoController!.seekTo(
                Duration(milliseconds: model.secondVideoStartPoint.toInt()));
            model.firstVideoController!.seekTo(
                Duration(milliseconds: model.firstVideoStartPoint.toInt()));
          } else if (model
                  .firstVideoController!.value.position.inMilliseconds >=
              controller.getFirstVideoEnd().toInt()) {
            model.firstVideoController!.pause();
          }
        },
        firstVideoStartPoint: model.firstVideoStartPoint,
        firstVideoIsLonger:
            (model.firstVideoEndPoint - model.firstVideoStartPoint) >=
                (model.secondVideoEndPoint - model.secondVideoStartPoint),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.appTitle ?? ''),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: 48,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          SettingsMenu(
            getLightmode: controller.getLightMode(),
            changeLanguage: (String languageCode) {
              controller.changeLanguage(context, languageCode);
            },
            newProject: () {
              controller.resetEverything();
            },
            saveProject: () async {
              // save Project
              String firstVideoPath = model.firstVideo!.path;
              String secondVideoPath = model.secondVideo!.path;

              SavingWidget().show(context);
              await controller.downloadVideos(
                firstVideoPath,
                secondVideoPath,
                model.firstVideoStartPoint,
                model.firstVideoEndPoint,
                model.secondVideoStartPoint,
                model.secondVideoEndPoint,
              );
              SavingWidget().dismiss();
            },
            themeSwitch: () {
              controller.switchColorMode();
              controller.getLightMode()
                  ? Get.changeTheme(
                      ThemeData(
                        scaffoldBackgroundColor:
                            const Color.fromRGBO(178, 206, 222, 1),
                        appBarTheme: const AppBarTheme(
                          backgroundColor: Color.fromRGBO(178, 206, 222, 1),
                          iconTheme: IconThemeData(color: Colors.black),
                        ),
                        elevatedButtonTheme: ElevatedButtonThemeData(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                                255, 91, 31, 97), // 111, 104, 102, 1
                          ),
                        ),
                        primaryColor: Colors.black,
                        sliderTheme: const SliderThemeData(
                          activeTrackColor: Color.fromARGB(248, 88, 10, 161),
                          inactiveTrackColor: Color.fromARGB(204, 148, 10, 10),
                          //overlayColor: Color.fromARGB(150, 153, 32, 190),
                          trackHeight: 14,
                          thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 12, pressedElevation: 10),
                          thumbColor: Color.fromARGB(255, 255, 255, 255),
                          trackShape: RectangularSliderTrackShape(),
                          showValueIndicator: ShowValueIndicator.always,
                          valueIndicatorColor: Color.fromARGB(255, 0, 0, 0),
                          valueIndicatorTextStyle: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    )
                  : Get.changeTheme(
                      ThemeData(
                        scaffoldBackgroundColor:
                            const Color.fromARGB(255, 67, 13, 117),
                        appBarTheme: const AppBarTheme(
                          backgroundColor: Color.fromARGB(255, 67, 13, 117),
                        ),
                        elevatedButtonTheme: ElevatedButtonThemeData(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 216, 99, 67),
                          ),
                        ),
                        primaryColor: Colors.white,
                        sliderTheme: const SliderThemeData(
                          activeTrackColor: Color.fromARGB(249, 161, 151, 10),
                          inactiveTrackColor: Color.fromARGB(204, 14, 161, 117),
                          //overlayColor: Color.fromARGB(150, 153, 32, 190),
                          trackHeight: 14,
                          thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 12, pressedElevation: 10),
                          thumbColor: Color.fromARGB(255, 0, 0, 0),
                          trackShape: RectangularSliderTrackShape(),
                          showValueIndicator: ShowValueIndicator.always,
                          valueIndicatorColor: Colors.amber,
                          valueIndicatorTextStyle:
                              TextStyle(color: Colors.black),
                        ),
                      ),
                    );
            },
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
                              controller.isFirstVideoLonger()
                                  ? SmoothVideoProgress(
                                      controller: model.firstVideoController!,
                                      builder:
                                          (context, position, duration, _) =>
                                              VideoProgressSlider(
                                        position: Duration(
                                            milliseconds: (position
                                                        .inMilliseconds
                                                        .toDouble() -
                                                    model.firstVideoStartPoint)
                                                .toInt()),
                                        duration: Duration(
                                            milliseconds: (controller
                                                        .getFirstVideoEnd() -
                                                    model.firstVideoStartPoint)
                                                .toInt()),
                                        controller: model.firstVideoController!,
                                        secondController:
                                            model.secondVideoController!,
                                        getEndValue: () {
                                          return controller
                                              .getEndValue("first");
                                        },
                                        swatch: Colors.greenAccent,
                                      ),
                                    )
                                  : SmoothVideoProgress(
                                      controller: model.secondVideoController!,
                                      builder:
                                          (context, position, duration, _) =>
                                              VideoProgressSlider(
                                        position: Duration(
                                            milliseconds: (position
                                                        .inMilliseconds
                                                        .toDouble() -
                                                    model.secondVideoStartPoint)
                                                .toInt()),
                                        duration: Duration(
                                            milliseconds: (controller
                                                        .getSecondVideoEnd() -
                                                    model.secondVideoStartPoint)
                                                .toInt()),
                                        controller:
                                            model.secondVideoController!,
                                        secondController:
                                            model.firstVideoController!,
                                        getEndValue: () {
                                          return controller
                                              .getEndValue("second");
                                        },
                                        swatch: Colors.greenAccent,
                                      ),
                                    ),
                              model.firstVideoTapped &&
                                      model.firstVideoController != null &&
                                      !(model.firstVideoController!.value
                                          .isPlaying)
                                  ? VideoTrimmer(
                                      videoPlayerController:
                                          model.firstVideoController!,
                                      isItFirstVideo: true,
                                      videoEndPoint: (double value) {
                                        controller
                                            .changeFirstVideoEndPoint(value);
                                      },
                                      videoStartPoint: (double value) {
                                        controller
                                            .changeFirstVideoStartPoint(value);
                                      },
                                    )
                                  : const Center(),
                              model.secondVideoTapped &&
                                      model.secondVideoController != null &&
                                      !(model.secondVideoController!.value
                                          .isPlaying)
                                  ? VideoTrimmer(
                                      videoPlayerController:
                                          model.secondVideoController!,
                                      isItFirstVideo: false,
                                      videoEndPoint: (double value) {
                                        controller
                                            .changeSecondVideoEndPoint(value);
                                      },
                                      videoStartPoint: (double value) {
                                        controller
                                            .changeSecondVideoStartPoint(value);
                                      },
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

  void setFirstController(VideoPlayerController controller);

  void setSecondController(VideoPlayerController controller);

  void setFirstVideo(File video);

  void setSecondVideo(File video);

  bool getLightMode();

  void switchColorMode();

  void firstVideoTapped();

  void secondVideoTapped();

  void changeFirstVideoStartPoint(double startPoint);

  void changeFirstVideoEndPoint(double endPoint);

  void changeSecondVideoStartPoint(double startPoint);

  void changeSecondVideoEndPoint(double endPoint);

  void changeLanguage(BuildContext context, String languageCode);

  double getFirstVideoEnd();

  double getSecondVideoEnd();

  void resetEverything();

  bool isFirstVideoLonger();

  double getStartValue(String videoName);

  double getEndValue(String videoName);

  Future<void> downloadVideos(
      String firstVideoPath,
      String secondVideoPath,
      double startPointFirst,
      double endPointFirst,
      double startPointSecond,
      double endPointSecond);
      
}
