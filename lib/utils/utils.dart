import 'package:flutter/material.dart';
import 'package:fyp_admin_app/utils/app_theme.dart';
import 'package:image_picker/image_picker.dart';

// for picking up image from gallery
pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);
  if (_file != null) {
    return await _file.readAsBytes();
  }
  print('No Image Selected');
}

// for displaying snackbars
showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
          text,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onErrorContainer,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.errorContainer,
    ),
    // SnackBar(
    //   content: Text(text),
    // ),
  );
}
