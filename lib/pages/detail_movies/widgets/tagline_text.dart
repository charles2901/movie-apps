import 'package:flutter/material.dart';
import 'package:movie_app/utils/k_textstyle.dart';

class TaglineText extends StatelessWidget {
  final String text;
  const TaglineText(this.text);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        '- “$text”',
        style: TStyle.text.copyWith(
          fontSize: 12,
          fontStyle: FontStyle.italic,
        ),
        textAlign: TextAlign.end,
      ),
    );
  }
}
