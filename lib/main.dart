//visualDensity: VisualDensity.adaptivePlatformDensity,
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:un_gallery/pages/HomePage.dart';

import 'models/Images.dart';

void main() {
  print('main app');
  // var images = ImagesDataProvider();
  // images.getNextImages();
  //Provider.of<ImagesDataProvider>(context);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ImagesDataProvider>(
            create: (context) => ImagesDataProvider()),
      ],
      child: MaterialApp(
        title: 'Unsplash galery',
        theme: ThemeData(primarySwatch: Colors.amber),
        home: HomePage(),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//       return
//      ChangeNotifierProvider<ImagesDataProvider>(
//       create: (context) => ImagesDataProvider(),
//       child: MaterialApp(
//         title: 'Unsplash galery',
//         theme: ThemeData(primarySwatch: Colors.amber),
//         home: HomePage(),
//       ),
//     );
//   }
// }
