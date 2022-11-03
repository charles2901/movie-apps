import 'package:get/get.dart';
import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/routes/route_name.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: RouteName.main, page: () => HomePage()),
];
