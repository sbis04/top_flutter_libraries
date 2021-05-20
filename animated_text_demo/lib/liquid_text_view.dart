import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class LiquidTextView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 50),
          Text(
            'TextLiquidFill',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 200),
          TextLiquidFill(
            text: 'CODE',
            waveColor: Colors.blueAccent.shade700,
            boxBackgroundColor: Colors.orange.shade600,
            textStyle: style,
            waveDuration: Duration(seconds: 4),
            boxHeight: 120,
            boxWidth: 300,
          ),
          TextLiquidFill(
            text: 'MAGIC',
            waveColor: Colors.blueAccent.shade700,
            boxBackgroundColor: Colors.orange.shade600,
            textStyle: style,
            waveDuration: Duration(seconds: 2),
            boxHeight: 120,
            boxWidth: 300,
          ),
        ],
      ),
    );
  }
}
