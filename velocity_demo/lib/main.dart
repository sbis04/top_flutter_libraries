import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() => runApp(
      MaterialApp(
        home: VelocityDemo(),
        debugShowCheckedModeBanner: false,
      ),
    );

class VelocityDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: VxBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              'VelocityX'.text.orange500.semiBold.size(40).make().p4(),
              VxZeroList(
                length: 3,
                isDark: true,
                isBottomLinesActive: false,
              ),
              [
                "Velocity 1"
                .text.white.uppercase.size(20).make().box.rounded.alignCenter.purple600.make().p4(),
                "Velocity 2"
                .text.white.uppercase.size(20).make().box.rounded.alignCenter.green500.make().p4(),
                "Velocity 3"
                .text.white.uppercase.size(20).make().box.rounded.alignCenter.orange500.make().p4(),
              ].swiper(enlargeCenterPage: true).py12(),
              'Codemagic'.text.uppercase.red600.bold.letterSpacing(8).size(40).make().p16(),
            ],
          ),
        ).make(),
      ),
    );
  }
}
