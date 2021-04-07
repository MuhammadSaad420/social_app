import 'package:flutter/material.dart';

import '../constant.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 12.0,
        physics: ScrollPhysics(),
        crossAxisSpacing: 17.0,
        children: imagePicsumUrl.map((String url) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(url),
              ),
              color: Colors.pink,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
          );
        }).toList());
  }
}
