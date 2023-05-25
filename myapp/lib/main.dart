import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/widgets/BorderedContainer.dart';
import 'package:myapp/widgets/RotateButton.dart';
import 'package:myapp/widgets/SpeedButton.dart';
import 'package:flutter/material.dart';
import 'widgets/AddButton.dart';
import 'widgets/CustomVideoPlayer.dart';
import 'package:video_player/video_player.dart';
import 'widgets/VideoChooser.dart';
import 'widgets/PlayButton.dart';

void main() {
  runApp(MyHomePage(
      firstVideo: File(""), numberOfVideos: 0, secondVideo: File("")));
}

class MyHomePage extends StatefulWidget {
  final int numberOfVideos;

  const MyHomePage({Key? key, required this.numberOfVideos, required File firstVideo, required File secondVideo}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  VideoPlayerController? _firstVideoController;
  VideoPlayerController? _secondVideoController;

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
                      child: widget.numberOfVideos == 2
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //video player (maybe need to outsource controller or give it back to the main)
                                if (_firstVideoController != null)
                                  AspectRatio(
                                    aspectRatio:
                                        _firstVideoController!.value.aspectRatio,
                                    child: VideoPlayer(_firstVideoController!),
                                  ),
                                if (_secondVideoController != null)
                                  AspectRatio(
                                    aspectRatio: _secondVideoController!.value.aspectRatio,
                                    child: VideoPlayer(_secondVideoController!),
                                  ),
                              ],
                            )
                          : widget.numberOfVideos == 1
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    if (_firstVideoController != null)
                                      AspectRatio(
                                        aspectRatio: _firstVideoController!.value.aspectRatio,
                                        child: VideoPlayer(_firstVideoController!),
                                      ),
                                    BorderedContainer(
                                      child: VideoChooserButton(
                                        onVideoSelected: (controller) {
                                          setState(() {
                                            _firstVideoController = controller;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    BorderedContainer(
                                      child: VideoChooserButton(
                                        onVideoSelected: (controller) {
                                          setState(() {
                                            _firstVideoController = controller;
                                          });
                                        },
                                      ),
                                    ),
                                    BorderedContainer(
                                      child: VideoChooserButton(
                                        onVideoSelected: (controller) {
                                          setState(() {
                                            _secondVideoController = controller;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                    ),
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
                          SpeedButton(),
                          PlayButton(
                            firstVideoController: _firstVideoController,
                            secondVideoController: _secondVideoController,
                          ),                      
                          RotateButton(),
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