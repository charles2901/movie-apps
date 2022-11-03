import 'package:get/get.dart';
import 'package:movie_app/bindings/home_bindings.dart';
import 'package:movie_app/controllers/home_controller.dart';
import 'package:movie_app/pages/home/home_page.dart';
import 'package:movie_app/routes/route_name.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: RouteName.main,
    page: () => HomePage(),
    binding: HomeBinding(),
  ),
];
