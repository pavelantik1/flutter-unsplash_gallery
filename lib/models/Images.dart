import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ImageItem {
  final String id;
  final String name;
  final String author;
  final String imgUrlSmall;
  final String imgUrlLarge;

  ImageItem({
    @required this.id,
    @required this.name,
    @required this.author,
    @required this.imgUrlSmall,
    @required this.imgUrlLarge,
  });
}

class ImagesDataProvider with ChangeNotifier {
  var img = ImageItem(
      id: '1',
      name: 'name',
      author: 'auth',
      imgUrlSmall: 'urlSm',
      imgUrlLarge: 'urlLar');
  int _pageNamber = 0;
  List<ImageItem> data = [];
  getNextImages() async {
    print('in get');
    var url = Uri.parse(
        'https://api.unsplash.com/photos?per_page=5&page=$_pageNamber');
    //url.queryParameters.addEntries({"per_page": "2", "page": "2"}.entries);
    var header = {
      'Accept-Version': 'v1',
      'Authorization':
          'Client-ID ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9 ',
    };

    var response = await http.get(url, headers: header);
    //print(response);
    if (response.statusCode == 200) {
      print('In response 200');
      _pageNamber++;
      print('_pageNamber');
      print(_pageNamber);
      var imageDataList = jsonDecode(response.body);
      //print('imageDataList=');
      //print(imageDataList.length);
      //print('imageDataList[0]=');
      // print(imageDataList[0]);
      //imageDataList.forEach();
      data = [
        ...imageDataList.map((item) {
          print('Item data:===================');
          print(item['id']);
          print(item['user']['name']);
          print(item['description'] == null ? 'Noname' : item['description']);
          return ImageItem(
            id: item['id'],
            name: item['description'] == null ? 'Noname' : item['description'],
            author: item['user']['name'],
            imgUrlSmall: item['urls']['thumb'],
            imgUrlLarge: item['urls']['small'],
          );
        }).toList()
      ];
      notifyListeners();
      print('New_data =');
      print(data);
    } else {
      print('Response.code is not 200');
    }
    //print('New_data =');
    //print('_data');
  }

  List<ImageItem> get images {
    // getNextImages();
    print('_data=');
    print(data);
    return data;
    //return [..._data];
  }

  int get page => _pageNamber;
}
