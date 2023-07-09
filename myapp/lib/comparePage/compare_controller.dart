import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vison/comparePage/LanguageService.dart';
import 'package:vison/comparePage/ThemeService.dart';
import 'package:vison/comparePage/compare_model.dart';
import 'package:vison/comparePage/compare_view.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:video_trimmer/video_trimmer.dart';

import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:path/path.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';

class CompareControllerImplmentation extends CompareController {
  final LanguageService _languageService = Get.find();
  final ThemeService _themeService = Get.find();

  CompareControllerImplmentation({
    CompareModel? model,
  }) : super(model ??
            const CompareModel(
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
    _themeService.switchTheme();
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
  double getFirstVideoEnd() {
    return state.firstVideoEndPoint;
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
  double getEndValue(String videoName) {
    if (videoName == "first") {
      return state.firstVideoEndPoint;
    } else {
      return state.secondVideoEndPoint;
    }
  }

  @override
  double getStartValue(String videoName) {
    if (videoName == "first") {
      return state.firstVideoStartPoint;
    } else {
      return state.secondVideoStartPoint;
    }
  }

  @override
  bool isFirstVideoLonger() {
    return (state.firstVideoEndPoint - state.firstVideoStartPoint) >=
        (state.secondVideoEndPoint - state.secondVideoStartPoint);
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
  Future<bool> downloadVideos(
      String firstVideoPath,
      String secondVideoPath,
      double startPointFirst,
      double endPointFirst,
      double startPointSecond,
      double endPointSecond,
      bool vertical) async {
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
    String outputPath = '$path$videoFileName$outputFormatString';
    debugPrint(outputPath);

    final List<String> commandHorizontal = [
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
      'vstack=inputs=2',
      '-r',
      '60',
      outputPath,
    ];

    final List<String> commandVertical = [
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
      '60',
      outputPath,
    ];

    List<String> executeCommand = commandHorizontal;
    if (vertical) {
      executeCommand = commandVertical;
    }

    bool didItWork = false;
    await FFmpegKit.executeWithArguments(executeCommand).then((value) async {
      final returnCode = await value.getReturnCode();

      if (ReturnCode.isSuccess(returnCode)) {
        await GallerySaver.saveVideo(outputPath);
        didItWork = true;
      }
    });
    return didItWork;
  }

  Future<String> _createFolderInAppDocDir(String folderName) async {
    Directory? directory;
    directory = await getExternalStorageDirectory();
    final Directory directoryFolder =
        Directory('${directory!.path}/$folderName');

    if (await directoryFolder.exists()) {
      debugPrint('Exists');
      return directoryFolder.path;
    } else {
      debugPrint('Creating');
      final Directory directoryNewFolder =
          await directoryFolder.create(recursive: true);
      return directoryNewFolder.path;
    }
  }
}
