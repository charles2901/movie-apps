import 'package:get/get.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/services/movie_services.dart';
import 'package:movie_app/utils/global_k.dart';

class HomeController extends GetxController {
  List<Movie> nowPlayingMovies = <Movie>[].obs;

  @override
  void onInit() {
    super.onInit();
    getNowPlayingMovies();
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
