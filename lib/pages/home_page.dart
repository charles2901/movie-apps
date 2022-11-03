import 'package:flutter/material.dart';
import 'package:movie_app/widget/base_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
