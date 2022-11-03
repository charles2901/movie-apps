import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/utils/global_k.dart';
import 'package:movie_app/utils/k_color.dart';

class MovieCard extends StatelessWidget {
  final String url;
  final int position;
  final double value;

  const MovieCard(this.url, {required this.position, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.identity()..rotateX((value - position) / 2.5),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
