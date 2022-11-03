import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/pages/home/widgets/movie_card.dart';
import 'package:movie_app/utils/k_textstyle.dart';
import 'package:get/get.dart';

class SectionHomePage extends StatelessWidget {
  final String title;
  final List<Movie> movies;

  const SectionHomePage({required this.title, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(title, style: TStyle.headline),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: movies
                .map(
                  (movie) => SizedBox(
                    width: Get.width * 0.35,
                    child: MovieCard(movie.posterPath, radius: 8, margin: 4),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
