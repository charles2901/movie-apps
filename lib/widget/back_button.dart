import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:movie_app/utils/k_color.dart';

class ButtonBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Get.back(),
      icon: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: kColorGrey.withOpacity(0.35),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          Icons.close,
          size: 24,
          color: kColorWhite,
        ),
      ),
    );
  }
}
