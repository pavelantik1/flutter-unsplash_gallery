//import '../models/Product.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:un_gallery/models/Images.dart';
import 'package:un_gallery/widgets/ImageElement.dart';
import 'package:un_gallery/widgets/imagesListElement.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  //.images;
  // var imageDatalist;
  @override
  Widget build(BuildContext context) {
    // Provider.of<ImagesDataProvider>(context, listen: false).getNextImages();

    final imageDatalist1 =
        Provider.of<ImagesDataProvider>(context, listen: false); //.data;
    Provider.of<ImagesDataProvider>(context, listen: false).getNextImages();

    return Scaffold(
      //appBar: AppBar(title: Text('${imageDatalist1.data.length}')),
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 55,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35),
            ),
          ),
          child: Column(
            children: [
              Flexible(child: ImagesListElement()),
              //BottomAppBar(child: Text('<=')),
            ],
          ),
          // Column(
          //   children: [
          //     ImagesListElement(),
          //     BottomNavigationBar(items: null) Container(width: 150, child: Text('Тут будуть кнопки <= =>')),
          //   ],
          // ),

          // children: <Widget>[
          // imageDatalist
          // ImageElement(index: index))

          // Card(
          //   elevation: 5,
          //   child: ListTile(
          //     leading: Image(
          //         image: NetworkImage(
          //             'https://www.nastol.com.ua/images/202010/nastol.com.ua_424535.jpg')),
          //     trailing: Text('22222'),
          //     title: Text('Title Listile'),
          //     subtitle: Text('text subtile'),
          //   ),
          // ),
          // Card(
          //   elevation: 5,
          //   child: ListTile(
          //     leading: Image(
          //         image: NetworkImage(
          //             'https://external-preview.redd.it/wl_OMEWEzDWAyDGU8-k469mI89a0HvNryasEQHxfceQ.jpg?width=640&crop=smart&auto=webp&s=19f15197e730b0f62bc09b0fb716f2231542679c')),
          //     trailing: Text('trailing'),
          //     title: Text('Title Listile'),
          //     subtitle: Text('text subtile'),
          //   ),
          // ),
          //  ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(child: Text('<=')),
      //bottomNavigationBar: BottomNavigationBar(items: [BottomNaviga]),
    );
  }
}
