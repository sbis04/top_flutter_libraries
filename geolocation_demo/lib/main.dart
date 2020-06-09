import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'geolocation_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geolocator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(headline6: TextStyle(fontSize: 40)),
      ),
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
        title: Text('Geolocator'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: GeolocationView(),
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
    );
  }
}
