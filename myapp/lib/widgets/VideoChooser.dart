import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:file_picker/file_picker.dart';

class VideoChooserButton extends StatefulWidget {
  final Function(VideoPlayerController, File) onVideoSelected;
  VideoPlayerController? controller;
  File? video;

  VideoChooserButton({
    Key? key,
    required this.onVideoSelected,
    this.controller,
    this.video,
  }) : super(key: key);

  @override
  _VideoChooserButtonState createState() => _VideoChooserButtonState();
}

class _VideoChooserButtonState extends State<VideoChooserButton> {
  Future<void> _pickVideo() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.video,
      allowCompression: false,
    );

    if (result != null) {
      final videoFile = File(result.files.single.path!);
      final controllerTmp = VideoPlayerController.file(
        videoFile,
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
      );
      await controllerTmp.initialize();
      setState(() {
        widget.controller = controllerTmp;
        widget.video = videoFile;
      });
      widget.onVideoSelected(controllerTmp, videoFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.controller != null
          ? SizedBox(
              height: 700,
              width: 800,
              child: VideoPlayer(widget.controller!),
            )
          : Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 5,
                ),
              ),
              child: IconButton(
                icon: const Icon(Icons.add),
                iconSize: 48,
                onPressed: _pickVideo,
              ),
            ),
    );
  }
}
