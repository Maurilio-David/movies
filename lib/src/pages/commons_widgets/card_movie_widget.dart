import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/src/models/movie_model.dart';
import 'package:movies/src/pages/commons_widgets/genres_widget.dart';
import 'package:movies/src/theme/app_theme.dart';
import 'package:movies/src/utils/constants/endpoints.dart';

class CardMovie extends StatelessWidget {
  const CardMovie({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      height: 470,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage('${Endpoints.image}${movie.posterPath}'),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(20),
        color: darkBlue,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00384c).withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Container(
        height: 161,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: darkGradient,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movie.title!.toUpperCase(),
              style: GoogleFonts.montserrat(
                color: white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            GenresWidget(movie: movie),
          ],
        ),
      ),
    );
  }
}
