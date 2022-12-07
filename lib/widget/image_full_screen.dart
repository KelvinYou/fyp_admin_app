import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageFullScreen extends StatelessWidget {
  final String imageUrl;

  ImageFullScreen({required this.imageUrl});

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
            imageProvider: NetworkImage(
                imageUrl
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