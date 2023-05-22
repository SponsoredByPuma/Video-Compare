import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/widgets/BorderedContainer.dart';
import 'package:myapp/widgets/RotateButton.dart';
import 'package:myapp/widgets/SpeedButton.dart';
import 'package:flutter/material.dart';
import 'widgets/AddButton.dart';
import 'widgets/CustomVideoPlayer.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MyHomePage(
      firstVideo: File(""), numberOfVideos: 0, secondVideo: File("")));
}

class MyHomePage extends StatefulWidget {
  final File firstVideo;
  final File secondVideo;
  final int numberOfVideos;

  const MyHomePage(
      {super.key,
      required this.firstVideo,
      required this.numberOfVideos,
      required this.secondVideo});

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
                      child: widget.numberOfVideos == 2
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //video player (maybe need to outsource controller or give it back to the main)
                                CustomVideoPlayer(
                                    videoLink: widget.firstVideo,
                                    autoPlay: false),
                                CustomVideoPlayer(
                                    videoLink: widget.secondVideo,
                                    autoPlay: false),
                              ],
                            )
                          : widget.numberOfVideos == 1
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CustomVideoPlayer(
                                        videoLink: widget.firstVideo,
                                        autoPlay: false),
                                    BorderedContainer(
                                      child: AddButton(
                                        numberOfVideos: widget.numberOfVideos,
                                        firstVideo: widget.firstVideo,
                                        secondVideo: widget.secondVideo,
                                      ),
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    BorderedContainer(
                                      child: AddButton(
                                        numberOfVideos: widget.numberOfVideos,
                                        firstVideo: widget.firstVideo,
                                        secondVideo: widget.secondVideo,
                                      ),
                                    ),
                                    BorderedContainer(
                                      child: AddButton(
                                        numberOfVideos: widget.numberOfVideos,
                                        firstVideo: widget.firstVideo,
                                        secondVideo: widget.secondVideo,
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
                    const Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SpeedButton(),
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
