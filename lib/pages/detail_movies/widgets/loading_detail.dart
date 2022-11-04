import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_app/utils/k_color.dart';
import 'package:movie_app/utils/k_textstyle.dart';

class LoadingDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitRotatingCircle(color: kColorLogo),
          const SizedBox(height: 8),
          Text('Fetching', style: TStyle.text.copyWith(color: kColorLogo)),
        ],
      ),
    );
  }
}
