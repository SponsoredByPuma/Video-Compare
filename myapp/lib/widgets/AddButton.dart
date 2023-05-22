import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:myapp/main.dart';
import 'package:open_file/open_file.dart';

class AddButton extends StatelessWidget {
  final int numberOfVideos;
  final File firstVideo;
  final File secondVideo;

  const AddButton(
      {Key? key,
      required this.numberOfVideos,
      required this.firstVideo,
      required this.secondVideo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.lightGreen,
        border: Border.all(
          color: Colors.white,
          width: 5,
        ),
      ),
      width: MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(context).size.width * 0.25,
      child: IconButton(
        icon: const Icon(Icons.add),
        iconSize: 48,
        onPressed: () async {
          // open file chooser
          FilePickerResult? result = await FilePicker.platform.pickFiles(
            type: FileType.video,
            allowCompression: false,
          );
          if (result != null) {
            File file = File(result.files.single.path!);
            print(firstVideo.toString() + " FIRST VIDEO LENGTH");
            if (firstVideo.toString() == "File: ''") {
              print("FIRST VIDEO LENGTH + test");
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return MyHomePage(
                        firstVideo: file,
                        numberOfVideos: numberOfVideos + 1,
                        secondVideo: secondVideo);
                  },
                ),
              );
            }
            if (secondVideo.path.isEmpty) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return MyHomePage(
                        firstVideo: firstVideo,
                        numberOfVideos: numberOfVideos + 1,
                        secondVideo: file);
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}
