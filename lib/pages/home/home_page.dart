import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controllers/home_controller.dart';
import 'package:movie_app/pages/home/section/popular.dart';
import 'package:movie_app/pages/home/widgets/section_home_page.dart';
import 'package:movie_app/utils/k_color.dart';
import 'package:movie_app/widget/base_widget.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: RefreshIndicator(
        color: kColorWhite,
        backgroundColor: Colors.transparent,
        onRefresh: () async {
          controller.fetchAll();
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top + 16),
              PopularSection(),
              const SizedBox(height: 16),
              Obx(
                () => SectionHomePage(
                  title: 'Upcoming Movies',
                  movies: controller.upComingMovies,
                  isLoading: controller.loadingUpcoming.value,
                  isError: controller.errorUpcoming.value,
                  errorMessage: controller.errorMsgUpcoming.value,
                  onRefresh: controller.getUpcomingMovies,
                ),
              ),
              const SizedBox(height: 16),
              Obx(
                () => SectionHomePage(
                  title: 'Top Rated',
                  movies: controller.topRatedMovies,
                  isLoading: controller.loadingTopRated.value,
                  isError: controller.errorTopRated.value,
                  errorMessage: controller.errorMsgTopRated.value,
                  onRefresh: controller.getTopRatedMovies,
                ),
              ),
              const SizedBox(height: 16),
              Obx(
                () => SectionHomePage(
                  title: 'Now Playing',
                  movies: controller.nowPlayingMovies,
                  isLoading: controller.loadingNowPlaying.value,
                  isError: controller.errorNowPlaying.value,
                  errorMessage: controller.errorMsgNowPlaying.value,
                  onRefresh: controller.getNowPlayingMovies,
                ),
              ),
              const SizedBox(height: 16),
              Obx(
                () => SectionHomePage(
                  title: 'Popular in Indonesia',
                  movies: controller.popularIDMovies,
                  isLoading: controller.loadingPopularID.value,
                  isError: controller.errorPopularID.value,
                  errorMessage: controller.errorMsgPopularID.value,
                  onRefresh: controller.getPopularIDMovies,
                ),
              ),
              const SizedBox(height: 16),
              Obx(
                () => SectionHomePage(
                  title: 'Top in Indonesia',
                  movies: controller.topRatedIDMovies,
                  isLoading: controller.loadingTopRatedID.value,
                  isError: controller.errorTopRatedID.value,
                  errorMessage: controller.errorMsgTopRatedID.value,
                  onRefresh: controller.getTopRatedIDMovies,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
