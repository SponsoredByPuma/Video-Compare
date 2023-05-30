import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class SpeedButton extends StatefulWidget {
  final VideoPlayerController? firstVideoController;
  final VideoPlayerController? secondVideoController;

  const SpeedButton({
    Key? key,
    required this.firstVideoController,
    required this.secondVideoController,
  }) : super(key: key);

  @override
  _SpeedButtonState createState() => _SpeedButtonState();
}

class _SpeedButtonState extends State<SpeedButton> {
  bool _isSlowMotion = false;

  void _toggleSpeed() {
    setState(() {
      _isSlowMotion = !_isSlowMotion;
      if (_isSlowMotion) {
        widget.firstVideoController?.setPlaybackSpeed(0.5);
        widget.secondVideoController?.setPlaybackSpeed(0.5);
      } else {
        widget.firstVideoController?.setPlaybackSpeed(1.0);
        widget.secondVideoController?.setPlaybackSpeed(1.0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 48,
      child: MaterialButton(
        onPressed: () {
          _toggleSpeed();
        },
        color: Colors.blue,
        textColor: Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _isSlowMotion ? Icons.slow_motion_video : Icons.speed,
              size: 24,
            ),
            const SizedBox(width: 8.0),
            Text(
              _isSlowMotion ? 'Slow Motion' : 'Normal Speed',
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
