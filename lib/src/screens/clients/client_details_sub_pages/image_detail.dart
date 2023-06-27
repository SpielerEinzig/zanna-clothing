import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageDetail extends StatefulWidget {
  final String imageUrl;
  const ImageDetail({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<ImageDetail> createState() => _ImageDetailState();
}

class _ImageDetailState extends State<ImageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        child: PhotoView(
          imageProvider: NetworkImage(widget.imageUrl),
        ),
      ),
    );
  }
}
