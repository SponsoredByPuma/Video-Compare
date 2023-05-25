import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:file_picker/file_picker.dart';

class VideoChooserButton extends StatefulWidget {
  final Function(VideoPlayerController) onVideoSelected;

  const VideoChooserButton({Key? key, required this.onVideoSelected})
      : super(key: key);

  @override
  _VideoChooserButtonState createState() => _VideoChooserButtonState();
}

class _VideoChooserButtonState extends State<VideoChooserButton> {
  VideoPlayerController? _controller;

  Future<void> _pickVideo() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.video,
      allowCompression: false,
    );

    if (result != null) {
      final videoFile = File(result.files.single.path!);
      final controller = VideoPlayerController.file(videoFile, videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true));
      await controller.initialize();
      setState(() {
        _controller = controller;
      });
      widget.onVideoSelected(controller);

    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _pickVideo,
      child: _controller != null
          ? AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: VideoPlayer(_controller!),
            )
          : const Text('Choose a video'),
    );
  }
}