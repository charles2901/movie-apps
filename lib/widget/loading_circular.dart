import 'package:flutter/material.dart';
import 'package:movie_app/utils/k_color.dart';

class LoadingCircular extends StatelessWidget {
  final double? value;
  const LoadingCircular({this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: CircularProgressIndicator(
        color: kColorWhite,
        value: value,
      ),
    );
  }
}
