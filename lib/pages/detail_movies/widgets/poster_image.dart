import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/model/detail_movie.dart';
import 'package:movie_app/utils/helper.dart';
import 'package:movie_app/utils/k_color.dart';
import 'package:movie_app/utils/k_styles.dart';
import 'package:movie_app/utils/k_textstyle.dart';

class PosterDetailMovies extends StatelessWidget {
  final DetailMovie movie;

  const PosterDetailMovies(this.movie);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Get.height * 0.7,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: CachedNetworkImage(
                imageUrl: movie.posterPath!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: Get.width,
              decoration: kTransparent,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: kColorWhite,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          Helper.convertMinutes(movie.runtime!),
                          style: TStyle.text,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: kColorLogo),
                          Text(
                            movie.voteAverage!.toStringAsFixed(1),
                            style: TStyle.text,
                          ),
                        ],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '(${movie.voteCount! > 0 ? '${movie.voteCount!.toString()} Reviews' : 'No Reviews'})',
                        style: TStyle.text.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
