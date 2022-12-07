

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class MemoryImageFullScreen extends StatelessWidget {
  final Uint8List image;

  MemoryImageFullScreen({required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
          ),
          child: PhotoView(
            imageProvider: MemoryImage(
                image
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}