import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:un_gallery/models/Images.dart';

class ImageElement extends StatelessWidget {
  final int index;
  ImageElement({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageEl = Provider.of<ImagesDataProvider>(context).data;

    return Card(
        elevation: 5,
        child: Row(children: <Widget>[
          //Hero(
          //tag: "image-el",
          // child:
          Image(image: NetworkImage(imageEl[index].imgUrlSmall)),
          //),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.cyan,
                  child: Text('11111111'),
                ),
                // Text('${imageEl[index].author}',
                //     softWrap: false, overflow: TextOverflow.clip),
                Container(
                  width: 150,
                  color: Colors.red,
                  child: Text(
                    '${imageEl[index].name}',
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}

//  ListTile(
//         leading: Image(image: NetworkImage(imageEl[index].imgUrlSmall)),
//         trailing: Text('${imageEl[index].author}'),
//         title: Text('${imageEl[index].name}'),
//         subtitle: Text('$index'),
//       ),
