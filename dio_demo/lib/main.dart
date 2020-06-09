import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'build_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mockito',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final EdgeInsets _padding =
      const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mockito'),
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: BuildView(),
              ),
              Padding(
                padding: _padding,
                child: Text(
                  'NOTE: This is just a sample app for starting a build, but doesn\'t have any additional functionality for tracking the build or cancelling it.',
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
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
