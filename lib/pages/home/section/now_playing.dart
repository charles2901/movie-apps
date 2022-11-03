import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controllers/home_controller.dart';
import 'package:movie_app/pages/home/widgets/movie_card.dart';
import 'package:movie_app/utils/k_textstyle.dart';

class NowPlayingSection extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text('Now Playing', style: TStyle.headline),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: Get.width,
            height: Get.height * 0.45,
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: controller.pageControllerNP,
              itemCount: controller.nowPlayingMovies.length,
              itemBuilder: (_, index) => Obx(
                () => MovieCard(
                  controller.nowPlayingMovies[index].posterPath,
                  position: index,
                  value: controller.currentPageValue.value,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
