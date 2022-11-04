import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/utils/global_k.dart';
import 'package:movie_app/utils/k_color.dart';
import 'package:movie_app/utils/k_textstyle.dart';

class ErrorApiWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRefresh;
  final bool isCenter;
  const ErrorApiWidget({
    required this.message,
    required this.onRefresh,
    this.isCenter = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isCenter
          ? EdgeInsets.only(top: Get.height * 0.3)
          : const EdgeInsets.symmetric(vertical: 16),
      width: double.infinity,
      child: Column(
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: TStyle.text,
          ),
          IconButton(
            onPressed: onRefresh,
            icon: Icon(
              Icons.refresh,
              color: kColorWhite,
            ),
          ),
        ],
      ),
    );
  }
}
