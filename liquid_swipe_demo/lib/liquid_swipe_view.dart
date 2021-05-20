import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import 'pages.dart';

class LiquidSwipeView extends StatelessWidget {
  // List of Containers
  final pages = [
    codemagicPage,
    welcomePage,
  ];

  @override
  Widget build(BuildContext context) {
    return LiquidSwipe(
      pages: pages,
      fullTransitionValue: 200,
      slideIconWidget: Icon(Icons.arrow_back_ios),
      enableLoop: true,
      positionSlideIcon: 0.8,
      waveType: WaveType.liquidReveal,
    );
  }
}
