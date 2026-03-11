import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PersonCacheImage extends StatelessWidget {
  final String imageURL;
  final double width, height;

  const PersonCacheImage(this.imageURL, this.width, this.height, {super.key});

  Widget _imageWidget(ImageProvider imageProvider) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          bottomLeft: Radius.circular(8),
        ),
        image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageURL,
      width: width,
      height: height,
      imageBuilder: (context, imageProvider) {
        return _imageWidget(imageProvider);
      },
      placeholder: (context, url) {
        return Center(child: CircularProgressIndicator());
      },
      errorWidget: (context, url, error) {
        return _imageWidget(AssetImage('assets/images/noimage.jpg'));
      },
    );
  }
}
