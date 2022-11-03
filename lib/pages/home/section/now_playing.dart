import 'package:flutter/material.dart';
import 'package:movie_app/pages/home/widgets/movie_card.dart';
import 'package:movie_app/utils/k_textstyle.dart';
import 'package:get/get.dart';
import 'package:movie_app/controllers/home_controller.dart';

class NowPlayingSection extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text('Now Playing', style: TStyle.headline),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: controller.nowPlayingMovies
                .map((movie) => SizedBox(
                      width: Get.width * 0.35,
                      child: MovieCard(
                        movie.posterPath,
                        radius: 8,
                        margin: 4,
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
