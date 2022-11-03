import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/services/movie_services.dart';
import 'package:movie_app/utils/global_k.dart';

class HomeController extends GetxController {
  // FOR Upcoming
  var loadingUpcoming = false.obs;
  var errorUpcoming = false.obs;
  var errorMsgUpcoming = ''.obs;
  List<Movie> upComingMovies = <Movie>[].obs;

  // FOR Top Rated
  var loadingTopRated = false.obs;
  var errorTopRated = false.obs;
  var errorMsgTopRated = ''.obs;
  List<Movie> topRatedMovies = <Movie>[].obs;

  // FOR Now Playing
  var errorNowPlaying = false.obs;
  var loadingNowPlaying = false.obs;
  var errorMsgNowPlaying = ''.obs;
  List<Movie> nowPlayingMovies = <Movie>[].obs;

  // Popular Movies
  var loadingPopular = false.obs;
  var errorPopular = false.obs;
  var errorMsgPopular = ''.obs;
  PageController pageControllerNP = PageController(
    viewportFraction: 0.7,
    initialPage: 0,
  );
  var currentPageValue = 0.0.obs;
  List<Movie> popularMovies = <Movie>[].obs;

  @override
  void onInit() {
    super.onInit();

    fetchAll();

    pageControllerNP.addListener(() {
      currentPageValue.value = pageControllerNP.page as double;
    });
  }

  void fetchAll() {
    getNowPlayingMovies();
    getPopularMovies();
    getTopRatedMovies();
    getUpcomingMovies();
  }

  void getPopularMovies() async {
    try {
      loadingPopular.value = true;
      setErrorPopular(false);
      var list = await MovieServices.getPopular();

      if (list != null) {
        popularMovies.clear();
        popularMovies.addAll(list);
      } else {
        setErrorPopular(true);
      }
      currentPageValue.value = 0.0;
      loadingPopular.value = false;
    } on SocketException {
      loadingPopular.value = false;
      setErrorPopular(true, message: 'Internet Connection Error');
    } catch (err) {
      logPrint('ERR getPopularMovies : $err');
      loadingPopular.value = false;
      setErrorPopular(true);
    }
  }

  void getNowPlayingMovies() async {
    try {
      loadingNowPlaying.value = true;
      setErrorNowPlaying(false);
      var list = await MovieServices.getNowPlaying();

      if (list != null) {
        nowPlayingMovies.clear();
        nowPlayingMovies.addAll(list);
      } else {
        setErrorNowPlaying(true);
      }
      loadingNowPlaying.value = false;
    } on SocketException {
      setErrorNowPlaying(true, message: 'Internet Connection Error');
      loadingNowPlaying.value = false;
    } catch (err) {
      logPrint('ERR getNowPlayingMovies : $err');
      loadingNowPlaying.value = false;
      setErrorNowPlaying(true);
    }
  }

  void getTopRatedMovies() async {
    try {
      loadingTopRated.value = true;
      setErrorTopRated(false);
      var list = await MovieServices.getTopRated();

      if (list != null) {
        topRatedMovies.addAll(list);
      } else {
        setErrorTopRated(true);
      }
      loadingTopRated.value = false;
    } on SocketException {
      setErrorTopRated(true, message: 'Internet Connection Error');
      loadingTopRated.value = false;
    } catch (err) {
      logPrint('ERR getPopularMovies : $err');
      loadingTopRated.value = false;
      setErrorTopRated(true);
    }
  }

  void getUpcomingMovies() async {
    try {
      loadingUpcoming.value = true;
      setErrorUpcoming(false);
      var list = await MovieServices.getUpcoming();

      if (list != null) {
        upComingMovies.addAll(list);
      } else {
        setErrorUpcoming(true);
      }
      loadingUpcoming.value = false;
    } on SocketException {
      setErrorUpcoming(true, message: 'Internet Connection Error');
      loadingUpcoming.value = false;
    } catch (err) {
      logPrint('ERR getUpcomingMovies : $err');
      loadingUpcoming.value = false;
      setErrorUpcoming(true);
    }
  }

  void setErrorUpcoming(bool value,
      {String message = 'Something went error.'}) {
    errorUpcoming.value = value;
    errorMsgUpcoming.value = value ? message : '';
  }

  void setErrorTopRated(bool value,
      {String message = 'Something went error.'}) {
    errorTopRated.value = value;
    errorMsgTopRated.value = value ? message : '';
  }

  void setErrorNowPlaying(bool value,
      {String message = 'Something went error.'}) {
    errorNowPlaying.value = value;
    errorMsgNowPlaying.value = value ? message : '';
  }

  void setErrorPopular(bool value, {String message = 'Something went error.'}) {
    errorPopular.value = value;
    errorMsgPopular.value = value ? message : '';
  }
}
