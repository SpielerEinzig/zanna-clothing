import 'package:flutter/material.dart';

class PageNavigation {
  pushPage({required context, required Widget page}) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => page));
  }

  replacePage({required context, required Widget page}) {
    return Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => page));
  }

  popPagesMultipleTimes({
    required context,
    required int times,
  }) {
    int count = 0;

    Navigator.popUntil(context, (route) {
      return count++ == times;
    });
  }
}
