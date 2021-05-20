import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'localization_view.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Easy Localization'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: LocalizationView(),
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
