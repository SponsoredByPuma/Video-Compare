import 'package:flutter/material.dart';
import 'package:myapp/widgets/BorderedContainer.dart';
import 'package:myapp/widgets/RotateButton.dart';
import 'package:myapp/widgets/SpeedButton.dart';
import 'package:flutter/material.dart';
import 'widgets/AddButton.dart';
import 'widgets/CustomVideoPlayer.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyHomePage());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Video Compare',
        theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(255, 11, 68, 6)),
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Video Compare"),
              backgroundColor: const Color.fromARGB(255, 11, 68, 6),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                iconSize: 48,
                onPressed: () {
                  // Do something
                },
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  iconSize: 48,
                  onPressed: () {
                    // Do something
                  },
                ),
              ],
            ),
            body: Column(
              children: <Widget>[
                Expanded(
                    child: Container(
                        color: const Color.fromARGB(255, 31, 111, 43),
                        child: const Column(
                          children: [
                            Expanded(
                                flex: 7,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    //video player (maybe need to outsource controller or give it back to the main)
                                    CustomVideoPlayer(
                                        videoLink:
                                            "https://assets.mixkit.co/videos/preview/mixkit-young-man-at-the-bowling-center-makes-a-shot-49114-large.mp4 ",
                                        autoPlay: false),
                                    CustomVideoPlayer(
                                        videoLink:
                                            "https://assets.mixkit.co/videos/preview/mixkit-young-woman-missing-a-bowling-shot-49115-large.mp4",
                                        autoPlay: false),
                                  ],
                                )),
                            Expanded(

                                // the const can be removed later on
                                flex: 2,
                                child: Row(
                                  children: [
                                    // Here should be the video trimmer bar !
                                  ],
                                )),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  SpeedButton(),
                                  RotateButton(),
                                ],
                              ),
                            )
                          ],
                        )))
              ],
            )));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //bool videosHorizontal = false;
  //bool slowedDown = false;
  bool bothVideosPicked = false;
  bool showSettings = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Video Compare',
        theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(255, 11, 68, 6)),
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Video Compare"),
              backgroundColor: const Color.fromARGB(255, 11, 68, 6),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                iconSize: 48,
                onPressed: () {
                  // Do something
                },
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  iconSize: 48,
                  onPressed: () {
                    // Do something
                    showSettings = !showSettings;
                  },
                ),
              ],
            ),
            body: Column(
              children: <Widget>[
                Expanded(
                    child: Container(
                        color: const Color.fromARGB(255, 31, 111, 43),
                        child: Column(
                          children: [
                            Expanded(
                                flex: 7,
                                child: bothVideosPicked
                                    ? const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          //video player (maybe need to outsource controller or give it back to the main)
                                          CustomVideoPlayer(
                                              videoLink:
                                                  "https://assets.mixkit.co/videos/preview/mixkit-young-man-at-the-bowling-center-makes-a-shot-49114-large.mp4 ",
                                              autoPlay: false),
                                          CustomVideoPlayer(
                                              videoLink:
                                                  "https://assets.mixkit.co/videos/preview/mixkit-young-woman-missing-a-bowling-shot-49115-large.mp4",
                                              autoPlay: false),
                                        ],
                                      )
                                    : const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          BorderedContainer(child: AddButton()),
                                          BorderedContainer(child: AddButton()),
                                        ],
                                      )),
                            const Expanded(

                                // the const can be removed later on
                                flex: 2,
                                child: Row(
                                  children: [
                                    // Here should be the video trimmer bar !
                                  ],
                                )),
                            const Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  SpeedButton(),
                                  RotateButton(),
                                ],
                              ),
                            )
                          ],
                        )))
              ],
            )));
  }
}
