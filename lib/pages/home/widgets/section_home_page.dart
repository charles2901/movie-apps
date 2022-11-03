import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/pages/home/widgets/movie_card.dart';
import 'package:movie_app/utils/k_textstyle.dart';
import 'package:get/get.dart';
import 'package:movie_app/widget/error_api_widget.dart';
import 'package:movie_app/widget/shimmer_movie_list.dart';

class SectionHomePage extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  final bool isLoading;
  final bool isError;
  final String errorMessage;
  final VoidCallback onRefresh;

  const SectionHomePage({
    required this.isLoading,
    required this.title,
    required this.movies,
    required this.isError,
    required this.errorMessage,
    required this.onRefresh,
  });

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
        isError
            ? ErrorApiWidget(message: errorMessage, onRefresh: onRefresh)
            : Column(
                children: [
                  if (isLoading)
                    ShimmerMovieList(widthShimmer: Get.width * 0.35),
                  if (!isLoading)
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: movies
                            .map(
                              (movie) => SizedBox(
                                width: Get.width * 0.35,
                                child: MovieCard(movie.posterPath,
                                    radius: 8, margin: 4),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                ],
              )
      ],
    );
  }
}
