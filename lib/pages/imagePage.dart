import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// class ImagePage extends StatelessWidget {
//   final imageUrl;
//   const ImagePage({Key key, this.imageUrl}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool isFullscrin = false;
//     return Scaffold(
//       extendBody: true,
//       body: SizedBox(
//         child: Container(
//           color: Colors.red,
//           height: 750,
//           child: InkWell(
//             onTap: () {
//               SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
//               Navigator.of(context).pop(context);
//             },
//             onDoubleTap: () {
//               isFullscrin = !isFullscrin;
//             },
//             child: Image(
//               image: NetworkImage(imageUrl),
//               fit: isFullscrin ? BoxFit.cover : BoxFit.contain,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// Text('$imageUrl')

class ImagePage extends StatefulWidget {
  final imageUrl;
  ImagePage({Key key, this.imageUrl}) : super(key: key);

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  bool _isFullscreen = false;

  void _doublTap() {
    print(_isFullscreen);
    setState(() {
      _isFullscreen = !_isFullscreen;
    });
    print(_isFullscreen);
  }

  @override
  Widget build(BuildContext context) {
    //bool isFullscrin = false;
    return Container(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.yellow,
        body: SizedBox(
          child: Container(
            color: Colors.red,
            height: MediaQuery.of(context).size.height,
            child: InkWell(
              onTap: () {
                SystemChrome.setEnabledSystemUIOverlays([
                  SystemUiOverlay.top,
                ]);
                Navigator.of(context).pop(context);
              },
              onDoubleTap: _doublTap,
              child:
                  // Hero(
                  // tag: "image-el",
                  // child:
                  Image(
                image: NetworkImage(widget.imageUrl),
                fit: _isFullscreen ? BoxFit.cover : BoxFit.contain,
              ),
              //),
            ),
          ),
        ),
      ),
    );
  }
}
