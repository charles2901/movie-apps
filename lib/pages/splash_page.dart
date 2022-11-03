import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:movie_app/helper/asset_constant.dart';
import 'package:movie_app/routes/route_name.dart';
import 'package:movie_app/utils/k_textstyle.dart';
import 'package:movie_app/widget/base_widget.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Stack(
          children: [
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      'Noovies',
                      textStyle: TStyle.logo.copyWith(),
                      speed: const Duration(milliseconds: 500),
                    ),
                  ],
                  isRepeatingAnimation: false,
                  onFinished: () => Get.offAllNamed(RouteName.main),
                ),
              ),
            ),
            Positioned(
              bottom: 24,
              right: 0,
              child: SvgPicture.asset(
                AssetConstant.tmdbLogo,
                height: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
