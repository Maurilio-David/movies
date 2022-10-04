import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/src/theme/app_theme.dart';

class CustomTabLabel extends StatelessWidget {
  final String label;
  final int position;
  final int positionAtual;
  const CustomTabLabel({
    required this.label,
    required this.position,
    required this.positionAtual,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: position == positionAtual ? darkBlue : ice),
          borderRadius: BorderRadius.circular(20),
          color: position == positionAtual ? darkBlue : white),
      child: Text(label,
          style: GoogleFonts.montserrat(
              fontSize: 12, fontWeight: FontWeight.w400)),
    );
  }
}
