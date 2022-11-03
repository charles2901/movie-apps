import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/services/movie_services.dart';
import 'package:movie_app/utils/global_k.dart';

class HomeController extends GetxController {
  // FOR Top Rated
  List<Movie> upComingMovies = <Movie>[].obs;

  // FOR Top Rated
  List<Movie> topRatedMovies = <Movie>[].obs;

  // FOR UPCOMING MOVIE
  List<Movie> nowPlayingMovies = <Movie>[].obs;

  // Popular Movies
  var loading = false.obs;
  PageController pageControllerNP = PageController(
    viewportFraction: 0.7,
    initialPage: 1,
  );
  var currentPageValue = 0.0.obs;
  List<Movie> popularMovies = <Movie>[].obs;

  @override
  void onInit() {
    super.onInit();
    getNowPlayingMovies();
    getPopularMovies();
    getTopRatedMovies();
    getUpcomingMovies();

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

  void getPopularMovies() async {
    try {
      var list = await MovieServices.getPopular();

      if (list != null) {
        popularMovies.addAll(list);
      }
    } catch (err) {
      logPrint('ERR getPopularMovies : $err');
    }
  }

  void getTopRatedMovies() async {
    try {
      var list = await MovieServices.getTopRated();

      if (list != null) {
        topRatedMovies.addAll(list);
      }
    } catch (err) {
      logPrint('ERR getPopularMovies : $err');
    }
  }

  void getUpcomingMovies() async {
    try {
      var list = await MovieServices.getUpcoming();

      if (list != null) {
        upComingMovies.addAll(list);
      }
    } catch (err) {
      logPrint('ERR getUpcomingMovies : $err');
    }
  }
}
