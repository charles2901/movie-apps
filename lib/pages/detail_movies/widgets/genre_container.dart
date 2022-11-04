import 'package:flutter/material.dart';
import 'package:movie_app/utils/k_color.dart';
import 'package:movie_app/utils/k_textstyle.dart';

class GenreContainer extends StatelessWidget {
  final String genre;

  const GenreContainer(this.genre);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      margin: const EdgeInsets.only(right: 6, top: 4),
      decoration: BoxDecoration(
        color: kColorWhite.withOpacity(0.08),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        genre,
        style: TStyle.text.copyWith(fontSize: 12),
      ),
    );
  }
}
