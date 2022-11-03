import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/widget/shimmer_widget.dart';

class ShimmerMovieList extends StatelessWidget {
  final double widthShimmer;
  final double margin;
  final double? height;

  const ShimmerMovieList(
      {required this.widthShimmer, this.margin = 4, this.height});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          10,
          (index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: margin),
            child: ShimmerWidget(
              width: widthShimmer,
              height: height ?? Get.height * 0.22,
            ),
          ),
        ),
      ),
    );
  }
}
