import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:hooks_riverpod_test/src/data/models/character.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future<void> saveImage(
  BuildContext context,
  Character character,
) async {
  String? message;
  final scaffoldMessenger = ScaffoldMessenger.of(context);

  try {
    final response = await http.get(Uri.parse(character.url!));
    final dir = await getTemporaryDirectory();
    final fileName = '${dir.path}/image.png';
    final file = File(fileName);
    await file.writeAsBytes(response.bodyBytes);
    final params = SaveFileDialogParams(sourceFilePath: file.path);
    final finalPath = await FlutterFileDialog.saveFile(params: params);

    if (finalPath != null) {
      message = 'Image saved to disk';
    }
  } catch (e) {
    message = 'An error occurred while saving the image';
  }

  if (message != null) {
    scaffoldMessenger.showSnackBar(SnackBar(content: Text(message)));
  }
}
