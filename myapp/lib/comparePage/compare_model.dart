import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

part 'compare_model.freezed.dart';

@freezed
class CompareModel with _$CompareModel {
  const factory CompareModel({
    required bool vertical,
    required bool lightmode,
    required VideoPlayerController? firstVideoController,
    required VideoPlayerController? secondVideoController,
    required File? firstVideo,
    required File? secondVideo,
    required bool firstVideoTapped,
    required bool secondVideoTapped,
    required double firstVideoStartPoint,
    required double firstVideoEndPoint,
    required double secondVideoStartPoint,
    required double secondVideoEndPoint,
    required String currentLanguage,
  }) = _CompareModel;
}
