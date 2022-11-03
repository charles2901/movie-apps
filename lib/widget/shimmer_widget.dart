import 'package:flutter/material.dart';
import 'package:movie_app/utils/k_color.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({required this.width, this.height = 20});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: kColorMain,
        highlightColor: (Colors.grey[700])!,
        direction: ShimmerDirection.ltr,
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
