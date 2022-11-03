import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controllers/home_controller.dart';
import 'package:movie_app/widget/base_widget.dart';

class HomePage extends StatelessWidget {
  HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
