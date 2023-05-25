import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/widgets/AddButton.dart';
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
      final controller = VideoPlayerController.file(
        videoFile,
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
      );
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
    return Container(
      child: _controller != null
          ? SizedBox(
              height: 700,
              width: MediaQuery.of(context).size.width / 2,
              child: VideoPlayer(_controller!),
            )
          : Container(
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                border: Border.all(
                  color: Colors.white,
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
