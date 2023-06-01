import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      child: ElevatedButton(
        onPressed: () {
          _toggleSpeed();
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 8.0),
            Text(
              _isSlowMotion ? AppLocalizations.of(context)?.speedButtonSlowSpeed?? '' : AppLocalizations.of(context)?.speedButtonNormalSpeed ?? '',
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
