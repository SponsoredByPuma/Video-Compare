import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String videoLink;
  final bool autoPlay;

  const CustomVideoPlayer(
      {Key? key, required this.videoLink, this.autoPlay = false})
      : super(key: key);

  @override
  _CustomVideoPlayerState createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoLink);
    _controller.addListener(() {
      if (!_controller.value.isPlaying) {
        setState(() {
          _isPlaying = false;
        });
      }
    });
    _controller.setLooping(true);
    _controller.setVolume(0);
    _controller.initialize().then((_) {
      if (widget.autoPlay) {
        setState(() {
          _isPlaying = true;
        });
        _controller.play();
      } else {
        setState(() {});
      }
    }).catchError((error) {
      print('Error initializing video player: $error');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      decoration: const BoxDecoration(
        color: Colors.black,
        border: Border(
          right: BorderSide(
            color: Colors.white,
            width: 2,
          ),
          bottom: BorderSide(
            color: Colors.white,
            width: 2,
          ),
          top: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
      ),
      width: MediaQuery.of(context).size.width * 0.5,
      child: _controller.value.isInitialized
          ? GestureDetector(
              onTap: () {
                setState(() {
                  _isPlaying = !_isPlaying;
                  if (_isPlaying) {
                    _controller.play();
                  } else {
                    _controller.pause();
                  }
                });
              },
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
