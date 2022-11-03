import 'package:flutter/material.dart';
import 'package:movie_app/utils/k_color.dart';

class BaseWidget extends StatelessWidget {
  final Widget child;
  const BaseWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: kColorMain,
        child: child,
      ),
    );
  }
}
