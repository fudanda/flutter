import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class EmailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('List'),
        ),
        body: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            return new Image.network(
              "https://raw.githubusercontent.com/fudanda/images/master/overkill.png",
              fit: BoxFit.fill,
            );
          },
          itemCount: 10,
          viewportFraction: 0.8,
          scale: 0.9,
        ));
  }
}
