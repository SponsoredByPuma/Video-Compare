import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class AddButton extends StatelessWidget {
  const AddButton({Key? key}) : super(key: key);

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
          if (result == null) return;

          final file = result.files.first;
          openFile(file);
        },
      ),
    );
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}
