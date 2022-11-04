import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controllers/home_controller.dart';
import 'package:movie_app/model/detail_movie.dart';
import 'package:movie_app/pages/detail_movies/widgets/genre_container.dart';
import 'package:movie_app/pages/detail_movies/widgets/poster_image.dart';
import 'package:movie_app/pages/detail_movies/widgets/tagline_text.dart';
import 'package:movie_app/pages/home/widgets/section_home_page.dart';
import 'package:movie_app/utils/helper.dart';
import 'package:movie_app/utils/k_textstyle.dart';

class DetailContent extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();
  final DetailMovie movie;

  DetailContent(this.movie);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PosterDetailMovies(movie),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: movie.title!,
                    style: TStyle.headline,
                    children: [
                      TextSpan(
                        text: '  (${Helper.getYear(movie.releaseDate!)})',
                        style: TStyle.text.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                if (movie.tagline != null && movie.tagline!.isNotEmpty)
                  TaglineText(movie.tagline!),
                const SizedBox(height: 4),
                Wrap(
                  children: movie.genres!
                      .map((genre) => GenreContainer(genre.name!))
                      .toList(),
                ),
                const SizedBox(height: 8),
                Text(movie.overview!, style: TStyle.text),
                const SizedBox(height: 8),
              ],
            ),
          ),
          Obx(
            () => SectionHomePage(
              title: 'Similiar Movies',
              movies: controller.similiarMovies,
              isLoading: controller.loadingSimiliar.value,
              isError: controller.errorSimiliar.value,
              errorMessage: controller.errorMsgSimiliar.value,
              onRefresh: () => controller.getSimiliarMovie(controller.id.value),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
