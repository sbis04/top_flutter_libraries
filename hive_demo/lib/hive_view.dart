import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'color_page.dart';

class HiveView extends StatefulWidget {
  @override
  _HiveViewState createState() => _HiveViewState();
}

class _HiveViewState extends State<HiveView> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox('colors'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError)
            return Text(snapshot.error.toString());
          else
            return ColorPage();
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
