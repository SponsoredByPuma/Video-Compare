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

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeController controller =
        ref.read(providers.homeControllerProvider.notifier);
    final HomeModel model = ref.watch(providers.homeControllerProvider);

    Widget horizontalConainer = HorizontalContainer(
      leftVideoController: VideoChooserButton(
        controller: model.firstVideoController,
        video: model.firstVideo,
        onVideoSelected: (newController) {
          controller.setFirstController(newController);
        },
      ),
      rightVideoController: VideoChooserButton(
        controller: model.secondVideoController,
        video: model.secondVideo,
        onVideoSelected: (newController) {
          controller.setSecondController(newController);
        },
      ),
      controllerLeft: model.firstVideoController,
      controllerRight: model.secondVideoController,
      controller: controller,
    );

    Widget verticalContainer = VerticalContainer(
      leftVideoController: VideoChooserButton(
        controller: model.firstVideoController,
        video: model.firstVideo,
        onVideoSelected: (newController) {
          controller.setFirstController(newController);
        },
      ),
      rightVideoController: VideoChooserButton(
        controller: model.secondVideoController,
        video: model.secondVideo,
        onVideoSelected: (newController) {
          controller.setSecondController(newController);
        },
      ),
      controllerLeft: model.firstVideoController,
      controllerRight: model.secondVideoController,
      controller: controller,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.apptitle ?? ''),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: 48,
          onPressed: () {
            // Do something
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
                              model.firstVideoTapped
                                  ? ElevatedButton(
                                      onPressed: () {},
                                      child: const Text("FirstVideo"),
                                    )
                                  : const Center(),
                              model.secondVideoTapped
                                  ? ElevatedButton(
                                      onPressed: () {},
                                      child: const Text("SecondVideo"),
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

  void removeFirstVideo();

  void removeSecondVideo();

  bool getLightMode();

  void switchColorMode();

  void firstVideoTapped();

  void secondVideoTapped();
}
