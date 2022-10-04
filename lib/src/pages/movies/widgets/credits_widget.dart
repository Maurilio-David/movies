import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/src/models/cast_model.dart';
import 'package:movies/src/models/crew_model.dart';
import 'package:movies/src/theme/app_theme.dart';
import 'package:movies/src/utils/util_service.dart';

class CreditsWidget extends StatelessWidget {
  const CreditsWidget({Key? key, this.cast, this.crew}) : super(key: key);

  final List<Cast>? cast;
  final List<Crew>? crew;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    UtilService utilService = UtilService();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              cast != null ? 'Elenco' : 'Diretor',
              style: GoogleFonts.montserrat(
                  fontSize: 14, color: gray2, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            cast != null
                ? utilService.actors(cast!)
                : utilService.directors(crew!),
            style: GoogleFonts.montserrat(
                fontSize: 12, color: gray, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
