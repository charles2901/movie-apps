import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controllers/home_controller.dart';
import 'package:movie_app/pages/home/widgets/movie_card.dart';
import 'package:movie_app/utils/k_textstyle.dart';

class PopularSection extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text('Popular Movies', style: TStyle.headline),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: Get.width,
            height: Get.height * 0.4,
            child: PageView.builder(
              padEnds: false,
              physics: const BouncingScrollPhysics(),
              controller: controller.pageControllerNP,
              itemCount: controller.popularMovies.length,
              itemBuilder: (_, index) => Obx(
                () => Transform(
                  transform: Matrix4.identity()
                    ..rotateX((controller.currentPageValue.value - index) / 2.5)
                    ..rotateY(
                        (controller.currentPageValue.value - index) / 2.5),
                  child: MovieCard(
                    controller.popularMovies[index].posterPath,
                    radius: 15,
                    margin: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
