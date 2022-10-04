import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/src/models/movie_model.dart';
import 'package:movies/src/theme/app_theme.dart';

class GenresWidget extends StatelessWidget {
  const GenresWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      height: 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movie.genres!.length,
        itemBuilder: ((context, index) => Text(
              '${movie.genres![index].name} ${index + 1 == movie.genres!.length ? '' : ' - '}',
              style: GoogleFonts.montserrat(fontSize: 12, color: white),
            )),
      ),
    );
  }
}
