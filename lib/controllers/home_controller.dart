import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/services/movie_services.dart';
import 'package:movie_app/utils/global_k.dart';

class HomeController extends GetxController {
  // FOR UPCOMING MOVIE
  var loading = false.obs;
  PageController pageControllerNP = PageController(
    viewportFraction: 0.75,
    initialPage: 0,
  );
  var currentPageValue = 0.0.obs;
  List<Movie> nowPlayingMovies = <Movie>[].obs;

  @override
  void onInit() {
    super.onInit();
    getNowPlayingMovies();

    pageControllerNP.addListener(() {
      currentPageValue.value = pageControllerNP.page as double;
    });
  }

  void getNowPlayingMovies() async {
    try {
      var list = await MovieServices.getNowPlaying();

      if (list != null) {
        nowPlayingMovies.addAll(list);
      }
    } catch (err) {
      logPrint('ERR getNowPlayingMovies : $err');
    }
  }
}
