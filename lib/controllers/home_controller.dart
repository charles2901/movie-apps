import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/model/detail_movie.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/pages/detail_movies/detail_movies.dart';
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

  // FOR Popular in Indonesia
  var errorPopularID = false.obs;
  var loadingPopularID = false.obs;
  var errorMsgPopularID = ''.obs;
  List<Movie> popularIDMovies = <Movie>[].obs;

  // FOR Top Rated in Indoesia
  var errorTopRatedID = false.obs;
  var loadingTopRatedID = false.obs;
  var errorMsgTopRatedID = ''.obs;
  List<Movie> topRatedIDMovies = <Movie>[].obs;

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

  // FOR DETAIL MOVIES
  var id = 0.obs;
  var isDetailError = false.obs;
  var messageDetailError = ''.obs;
  var loadingDetail = false.obs;
  Rxn<DetailMovie> detailMovie = Rxn<DetailMovie>();

  //SIMILIAR MOVIE
  var loadingSimiliar = false.obs;
  var errorSimiliar = false.obs;
  var errorMsgSimiliar = ''.obs;
  List<Movie> similiarMovies = <Movie>[].obs;

  void setUpDetail(int idMovie) {
    id.value = idMovie;
    detailMovie.value = null;
    isDetailError.value = false;
    messageDetailError.value = '';
  }

  void showDetails(int idMovie, {isRefresh = false}) {
    if (id.value > 0 && !isRefresh) {
      Get.back();
    }
    fetchDetailMovies(idMovie);
    getSimiliarMovie(idMovie);
    if (!isRefresh) {
      Get.bottomSheet(DetailMovies(), isScrollControlled: true);
    }
  }

  void setErrorDetail({String message = 'Something went error.'}) {
    isDetailError.value = true;
    messageDetailError.value = message;
  }

  void fetchDetailMovies(int idMovie) async {
    try {
      loadingDetail.value = true;
      setUpDetail(idMovie);
      var response = await MovieServices.getDetails(idMovie);

      if (response != null) {
        detailMovie.value = response;
      } else {
        setErrorDetail();
        detailMovie.value = null;
      }
      loadingDetail.value = false;
    } on SocketException {
      loadingDetail.value = false;
      setErrorDetail(message: 'Internet Connection Error');
    } catch (err) {
      loadingDetail.value = false;
      setErrorDetail();
      logPrint('ERR fetchDetailMovies : $err');
    }
  }

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
    getPopularIDMovies();
    getTopRatedIDMovies();
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

  void getPopularIDMovies() async {
    try {
      loadingPopularID.value = true;
      setErrorPopularID(false);
      var list = await MovieServices.getPopular(region: 'ID');

      if (list != null) {
        popularIDMovies.clear();
        popularIDMovies.addAll(list);
      } else {
        setErrorPopularID(true);
      }
      loadingPopularID.value = false;
    } on SocketException {
      loadingPopularID.value = false;
      setErrorPopularID(true, message: 'Internet Connection Error');
    } catch (err) {
      logPrint('ERR getPopularMovies : $err');
      loadingPopularID.value = false;
      setErrorPopularID(true);
    }
  }

  void getTopRatedIDMovies() async {
    try {
      loadingTopRatedID.value = true;
      setErrorTopRatedID(false);
      var list = await MovieServices.getTopRated(region: 'ID');

      if (list != null) {
        topRatedIDMovies.clear();
        topRatedIDMovies.addAll(list);
      } else {
        setErrorTopRatedID(true);
      }
      loadingTopRatedID.value = false;
    } on SocketException {
      loadingTopRatedID.value = false;
      setErrorTopRatedID(true, message: 'Internet Connection Error');
    } catch (err) {
      logPrint('ERR getPopularMovies : $err');
      loadingTopRatedID.value = false;
      setErrorTopRatedID(true);
    }
  }

  void getSimiliarMovie(int id) async {
    try {
      loadingSimiliar.value = true;
      setErrorSimiliar(false);
      var list = await MovieServices.getSimiliarMovies(id);

      if (list != null) {
        similiarMovies.clear();
        similiarMovies.addAll(list);
      } else {
        setErrorSimiliar(true);
      }
      loadingSimiliar.value = false;
    } on SocketException {
      loadingSimiliar.value = false;
      setErrorSimiliar(true, message: 'Internet Connection Error');
    } catch (err) {
      logPrint('ERR getSimiliarMovie : $err');
      loadingSimiliar.value = false;
      setErrorSimiliar(true);
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

  void setErrorPopularID(
    bool value, {
    String message = 'Something went error.',
  }) {
    errorPopularID.value = value;
    errorMsgPopularID.value = value ? message : '';
  }

  void setErrorTopRatedID(
    bool value, {
    String message = 'Something went error.',
  }) {
    errorTopRatedID.value = value;
    errorMsgTopRatedID.value = value ? message : '';
  }

  void setErrorSimiliar(
    bool value, {
    String message = 'Something went error.',
  }) {
    errorSimiliar.value = value;
    errorMsgSimiliar.value = value ? message : '';
  }

  void setErrorPopular(
    bool value, {
    String message = 'Something went error.',
  }) {
    errorPopular.value = value;
    errorMsgPopular.value = value ? message : '';
  }
}
