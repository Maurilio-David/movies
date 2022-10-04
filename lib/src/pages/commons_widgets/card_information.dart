import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/src/theme/app_theme.dart';

class CardInformation extends StatelessWidget {
  const CardInformation({
    Key? key,
    required this.title,
    required this.information,
  }) : super(key: key);

  final String title;
  final String information;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration:
          BoxDecoration(color: ice, borderRadius: BorderRadius.circular(8)),
      child: Text.rich(
        TextSpan(children: [
          TextSpan(
            text: title,
            style: GoogleFonts.montserrat(
                fontSize: 12, fontWeight: FontWeight.w600, color: gray3),
          ),
          TextSpan(
            text: information,
            style: GoogleFonts.montserrat(
                fontSize: 14, fontWeight: FontWeight.w600, color: gray),
          ),
        ]),
      ),
    );
  }
}
