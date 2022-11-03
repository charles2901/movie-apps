import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controllers/home_controller.dart';
import 'package:movie_app/pages/home/section/popular.dart';
import 'package:movie_app/pages/home/widgets/section_home_page.dart';
import 'package:movie_app/widget/base_widget.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 16),
            PopularSection(),
            const SizedBox(height: 16),
            SectionHomePage(
              title: 'Upcoming Movies',
              movies: controller.upComingMovies,
            ),
            const SizedBox(height: 16),
            SectionHomePage(
              title: 'Top Rated',
              movies: controller.topRatedMovies,
            ),
            const SizedBox(height: 16),
            SectionHomePage(
              title: 'Now Playing',
              movies: controller.nowPlayingMovies,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
