import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/home/LanguageService.dart';
import 'package:myapp/home/home_model.dart';
import 'package:myapp/home/home_view.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:video_trimmer/video_trimmer.dart';

import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit_config.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:path/path.dart';

class HomeControllerImplmentation extends HomeController {
  final LanguageService _languageService = Get.find();
  HomeControllerImplmentation({
    HomeModel? model,
  }) : super(model ??
            const HomeModel(
              vertical: true,
              lightmode: true,
              firstVideoController: null,
              secondVideoController: null,
              firstVideo: null,
              secondVideo: null,
              firstVideoTapped: false,
              secondVideoTapped: false,
              firstVideoStartPoint: 0.0,
              firstVideoEndPoint: 0.0,
              secondVideoStartPoint: 0.0,
              secondVideoEndPoint: 0.0,
              currentLanguage: 'en',
            ));
  @override
  void changeLanguage(BuildContext context, String languageCode) {
    _languageService.changeLanguage(context, languageCode);
    state = state.copyWith(currentLanguage: _languageService.currentLanguage);
  }

  @override
  void rotate() {
    state = state.copyWith(vertical: !state.vertical);
  }

  @override
  void setFirstController(controller) {
    state = state.copyWith(firstVideoController: controller);
  }

  @override
  void setSecondController(controller) {
    state = state.copyWith(secondVideoController: controller);
  }

  @override
  bool getLightMode() {
    return state.lightmode;
  }

  @override
  void switchColorMode() {
    state = state.copyWith(lightmode: !state.lightmode);
  }

  @override
  void firstVideoTapped() {
    if (!state.secondVideoTapped) {
      state = state.copyWith(firstVideoTapped: !state.firstVideoTapped);
    }
  }

  @override
  void secondVideoTapped() {
    if (!state.firstVideoTapped) {
      state = state.copyWith(secondVideoTapped: !state.secondVideoTapped);
    }
  }

  @override
  void changeFirstVideoStartPoint(startPoint) {
    state = state.copyWith(firstVideoStartPoint: startPoint);
  }

  @override
  void changeFirstVideoEndPoint(endPoint) {
    state = state.copyWith(firstVideoEndPoint: endPoint);
  }

  @override
  void changeSecondVideoStartPoint(startPoint) {
    state = state.copyWith(secondVideoStartPoint: startPoint);
  }

  @override
  void changeSecondVideoEndPoint(endPoint) {
    state = state.copyWith(secondVideoEndPoint: endPoint);
  }

  @override
  double getFirstVideoStart() {
    return state.firstVideoStartPoint;
  }

  @override
  double getFirstVideoEnd() {
    return state.firstVideoEndPoint;
  }

  @override
  double getSecondVideoStart() {
    return state.secondVideoStartPoint;
  }

  @override
  double getSecondVideoEnd() {
    return state.secondVideoEndPoint;
  }

  @override
  void resetEverything() {
    state = state.copyWith(firstVideoController: null);
    state = state.copyWith(secondVideoController: null);
    state = state.copyWith(firstVideoTapped: false);
    state = state.copyWith(secondVideoTapped: false);
  }

  @override
  void setFirstVideo(File video) {
    state = state.copyWith(firstVideo: video);
  }

  @override
  void setSecondVideo(File video) {
    state = state.copyWith(secondVideo: video);
  }

  @override
  Future<void> downloadVideos(
      String firstVideoPath,
      String secondVideoPath,
      double startPointFirst,
      double endPointFirst,
      double startPointSecond,
      double endPointSecond) async {
    String videoFolderName = "Compare";
    String path = await _createFolderInAppDocDir(videoFolderName).whenComplete(
      () => debugPrint("Retrieved Trimmer folder"),
    );

    String dateTime = DateFormat.yMMMd()
        .addPattern('-')
        .add_Hms()
        .format(DateTime.now())
        .toString();
    final String videoName1 = basename(firstVideoPath).split('.')[0];
    String formattedDateTime = dateTime.replaceAll(' ', '');
    String videoFileName = "${videoName1}_trimmed:$formattedDateTime";

    Duration startPoint1 = Duration(milliseconds: startPointFirst.toInt());
    Duration endPoint1 = Duration(milliseconds: endPointFirst.toInt());
    Duration startPoint2 = Duration(milliseconds: startPointSecond.toInt());
    Duration endPoint2 = Duration(milliseconds: endPointSecond.toInt());
    debugPrint('startPoint1: $startPoint1');
    debugPrint('endPoint1: $endPoint1');
    debugPrint('startPoint2: $startPoint2');
    debugPrint('endPoint2: $endPoint2');

    FileFormat outputFormat = FileFormat.mp4;
    String outputFormatString = outputFormat.toString();
    debugPrint('OUTPUT: $outputFormatString');
    // -ss $startPoint1 -to $endPoint1
    // -ss $startPointSecond -to $endPoint2

    String trimLengthCommand = '-i "$firstVideoPath" -i "$secondVideoPath"';

    const filter =
        "[0:v]scale=1080:2040,setsar=1[l];[1:v]scale=1080:2040,setsar=1[r];[l][r]hstack";

    //String command = '$trimLengthCommand -filter_complex "$filter" -c:v copy ';
    String outputPath = '$path$videoFileName$outputFormatString';

    debugPrint(outputPath);

    final List<String> command = [
      '-i',
      firstVideoPath,
      '-ss',
      startPoint1.toString(),
      '-to',
      endPoint1.toString(),
      '-i',
      secondVideoPath,
      '-ss',
      startPoint2.toString(),
      '-to',
      endPoint2.toString(),
      '-filter_complex',
      'hstack=inputs=2',
      '-r',
      '30',
      outputPath,
    ];

    FFmpegKit.executeWithArgumentsAsync(command, (session) async {
      final state =
          FFmpegKitConfig.sessionStateToString(await session.getState());
      final returnCode = await session.getReturnCode();

      debugPrint("FFmpeg process exited with state $state and rc $returnCode");
      debugPrint(await session.getOutput());
      if (ReturnCode.isSuccess(returnCode)) {
        debugPrint("FFmpeg processing completed successfully.");
        debugPrint('Video successfully saved');
      } else {
        debugPrint(await session.getOutput());
        debugPrint("FFmpeg processing failed.");
        debugPrint('Couldn\'t save the video');
      }
    });
  }
}

Future<String> _createFolderInAppDocDir(String folderName) async {
  // Directory + folder name
  Directory? directory;
  directory = await getExternalStorageDirectory();
  final Directory directoryFolder = Directory('${directory!.path}/$folderName');

  if (await directoryFolder.exists()) {
    // If folder already exists return path
    debugPrint('Exists');
    return directoryFolder.path;
  } else {
    debugPrint('Creating');
    // If folder does not exists create folder and then return its path
    final Directory directoryNewFolder =
        await directoryFolder.create(recursive: true);
    return directoryNewFolder.path;
  }
}
