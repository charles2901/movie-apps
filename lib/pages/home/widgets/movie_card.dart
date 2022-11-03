import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String url;
  final double radius;
  final double margin;

  const MovieCard(
    this.url, {
    required this.radius,
    required this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: margin),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
