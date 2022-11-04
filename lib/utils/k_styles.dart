import 'package:flutter/material.dart';
import 'package:movie_app/utils/k_color.dart';

BoxDecoration kDetailMovies = BoxDecoration(
  borderRadius: const BorderRadius.only(
    topRight: Radius.circular(15),
    topLeft: Radius.circular(15),
  ),
  border: Border.all(
    color: kColorBlack,
  ),
  color: kColorMain,
);

BoxDecoration kTransparent = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      kColorBlack.withOpacity(0),
      kColorBlack.withOpacity(0.3),
      kColorBlack.withOpacity(0.5),
    ],
  ),
);
