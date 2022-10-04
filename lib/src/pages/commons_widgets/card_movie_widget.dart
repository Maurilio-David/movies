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
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      height: 470,
      decoration: BoxDecoration(
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
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: movie.posterPath != null
                ? Hero(
                    tag: movie.posterPath!,
                    child: Image.network(
                      '${Endpoints.image}${movie.posterPath}',
                      height: 470,
                      width: size.width - 40,
                      fit: BoxFit.cover,
                    ),
                  )
                : Container(
                    color: darkBlue,
                  ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 470,
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
            ],
          ),
        ],
      ),
    );
  }
}
