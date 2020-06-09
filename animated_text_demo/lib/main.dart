import 'package:flutter/material.dart';

import 'liquid_text_view.dart';

void main() {
  runApp(MyApp());
}

final TextStyle style = TextStyle(fontSize: 70, fontWeight: FontWeight.bold);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animated Text Kit',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Center(
          child: LiquidTextView(),
        ),
      ),
    );
  }
}
