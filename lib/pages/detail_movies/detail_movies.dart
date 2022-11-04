import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controllers/home_controller.dart';
import 'package:movie_app/pages/detail_movies/detail_content.dart';
import 'package:movie_app/pages/detail_movies/widgets/loading_detail.dart';
import 'package:movie_app/utils/k_styles.dart';
import 'package:movie_app/widget/back_button.dart';
import 'package:movie_app/widget/error_api_widget.dart';

class DetailMovies extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: kDetailMovies,
      child: Stack(
        children: [
          Obx(
            () => controller.isDetailError.value
                ? ErrorApiWidget(
                    message: controller.messageDetailError.value,
                    onRefresh: () => controller.showDetails(
                      controller.id.value,
                      isRefresh: true,
                    ),
                    isCenter: true,
                  )
                : controller.loadingDetail.value
                    ? LoadingDetail()
                    : controller.detailMovie.value != null
                        ? DetailContent(controller.detailMovie.value!)
                        : const SizedBox(),
          ),
          Positioned(
            top: 24,
            right: 12,
            child: ButtonBack(),
          ),
        ],
      ),
    );
  }
}
