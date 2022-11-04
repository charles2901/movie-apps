import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controllers/home_controller.dart';
import 'package:movie_app/pages/detail_movies/detail_movies.dart';

class MovieCard extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  final int id;
  final String url;
  final double radius;
  final double margin;

  MovieCard(
    this.id,
    this.url, {
    required this.radius,
    required this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.showDetails(id),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: margin),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: CachedNetworkImage(
            imageUrl: url,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
