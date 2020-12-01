import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:un_gallery/models/Images.dart';
import 'package:un_gallery/pages/imagePage.dart';

import 'ImageElement.dart';

class ImagesListElement extends StatelessWidget {
  const ImagesListElement({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageDatalist = Provider.of<ImagesDataProvider>(context);

    return Container(
      child: ListView.builder(
        itemCount: imageDatalist.data.length,
        itemBuilder: (context, int index) => InkWell(
          child: ImageElement(index: index),
          onTap: () => imageDatalist.getNextImages(),
          onDoubleTap: () {
            SystemChrome.setEnabledSystemUIOverlays([]);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    ImagePage(imageUrl: imageDatalist.data[index].imgUrlLarge),
              ),
            );
          },
        ),
      ),
    );
  }
}
