import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/widgets/BorderedContainer.dart';
import 'package:myapp/widgets/RotateButton.dart';
import 'package:myapp/widgets/SpeedButton.dart';
import 'package:flutter/material.dart';
import 'widgets/CustomVideoPlayer.dart';
import 'package:video_player/video_player.dart';
import 'widgets/VideoChooser.dart';
import 'widgets/PlayButton.dart';

void main() {
  runApp(const MyHomePage());
}

// horizontal vertikal
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  VideoPlayerController? _firstVideoController;
  VideoPlayerController? _secondVideoController;
  bool vertical = true;

  @override
  void dispose() {
    _firstVideoController?.dispose();
    _secondVideoController?.dispose();
    super.dispose();
  }

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
                child: Column(
                  children: [
                    Expanded(
                        flex: 7,
                        child: vertical
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  BorderedContainer(
                                    vertical: vertical,
                                    child: VideoChooserButton(
                                      onVideoSelected: (controller) {
                                        setState(() {
                                          _firstVideoController = controller;
                                        });
                                      },
                                    ),
                                  ),
                                  BorderedContainer(
                                    vertical: vertical,
                                    child: VideoChooserButton(
                                      onVideoSelected: (controller) {
                                        setState(() {
                                          _secondVideoController = controller;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  BorderedContainer(
                                    vertical: vertical,
                                    child: VideoChooserButton(
                                      onVideoSelected: (controller) {
                                        setState(() {
                                          _firstVideoController = controller;
                                        });
                                      },
                                    ),
                                  ),
                                  BorderedContainer(
                                    vertical: vertical,
                                    child: VideoChooserButton(
                                      onVideoSelected: (controller) {
                                        setState(() {
                                          _secondVideoController = controller;
                                        });
                                      },
                                    ),
                                  ),
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
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SpeedButton(
                            firstVideoController: _firstVideoController,
                            secondVideoController: _secondVideoController,
                          ),
                          PlayButton(
                            firstVideoController: _firstVideoController,
                            secondVideoController: _secondVideoController,
                          ),
                          RotateButton(buttonPressed: () {
                            setState(() {
                              vertical = !vertical;
                            });
                          }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
