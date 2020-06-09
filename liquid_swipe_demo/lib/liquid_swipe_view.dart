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
      enableSlideIcon: true,
      enableLoop: true,
      positionSlideIcon: 0.5,
      waveType: WaveType.liquidReveal,
    );
  }
}