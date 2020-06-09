import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'cached_image_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cached Image Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cached Network Image'),
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 10, left: 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Image url: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('https://loremflickr.com/100/100/music')
                  ],
                ),
              ),
              Expanded(
                child: CachedImageView(),
              ),
              'Codemagic'
                  .text
                  .uppercase
                  .red600
                  .bold
                  .letterSpacing(8)
                  .size(40)
                  .make()
                  .p16(),
            ],
          ),
        ),
      ),
    );
  }
}
