import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/src/controllers/home_controller.dart';
import 'package:movies/src/models/movie_model.dart';
import 'package:movies/src/pages/commons_widgets/card_information.dart';
import 'package:movies/src/pages/movies/widgets/credits_widget.dart';
import 'package:movies/src/theme/app_theme.dart';
import 'package:movies/src/utils/constants/endpoints.dart';
import 'package:movies/src/utils/util_service.dart';

class MovieDetailsScreen extends GetView<HomeController> {
  MovieDetailsScreen({Key? key}) : super(key: key);
  final Movie movie = Get.arguments;
  final UtilService utilService = UtilService();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  height: 303,
                  color: ice,
                ),
                SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          height: 32,
                          width: 80,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 3,
                                  blurRadius: 1,
                                  offset: const Offset(0, 0.5),
                                )
                              ]),
                          child: TextButton.icon(
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: gray2,
                              size: 15,
                            ),
                            label: Text(
                              'Voltar',
                              style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: gray2),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ),
                      ),
                      //Capa
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 32),
                        height: 318,
                        width: 216,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  '${Endpoints.image}${movie.posterPath}'),
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
                      ),
                      //Avaliação
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            movie.voteAverage!.toStringAsFixed(1),
                            style: GoogleFonts.montserrat(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: darkBlue),
                          ),
                          Text(
                            '/10',
                            style: GoogleFonts.montserrat(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: gray3),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      //Titulo
                      Text(
                        movie.title!.toUpperCase(),
                        style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: gray),
                      ),

                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        child: Text.rich(
                          TextSpan(children: [
                            TextSpan(
                              text: 'Titulo Original: ',
                              style: GoogleFonts.montserrat(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: gray2),
                            ),
                            TextSpan(
                              text: movie.originalTitle!.toUpperCase(),
                              style: GoogleFonts.montserrat(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: gray2),
                            ),
                          ]),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //Informações
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CardInformation(
                            title: 'Ano:  ',
                            information: utilService
                                .getYear(DateTime.parse(movie.releaseDate!)),
                          ),
                          CardInformation(
                              title: 'Duração:  ',
                              information:
                                  utilService.durationToString(movie.runtime!)),
                        ],
                      ),
                      //Generos
                      Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          width: size.width,
                          height: 30,
                          child: Column(
                            children: [
                              Flexible(
                                child: Wrap(
                                  children:
                                      utilService.getGenres(movie.genres!),
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 36,
                      ),
                      //Descrição
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Descrição',
                              style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  color: gray2,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        width: size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                movie.overview != null
                                    ? '${movie.overview}'
                                    : 'Indisponível',
                                style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    color: gray,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Informações
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CardInformation(
                              title: 'ORÇAMENTO:  ',
                              information:
                                  '${movie.budget != 0 ? '\$' : ''} ${utilService.formatMoeda(movie.budget!)}',
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                  color: ice,
                                  borderRadius: BorderRadius.circular(8)),
                              width: size.width,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'PRODUTORAS: ',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: gray3),
                                  ),
                                  Flexible(
                                    child: Text(
                                      utilService.producing(
                                          movie.productionCompanies!),
                                      style: GoogleFonts.montserrat(
                                          fontSize: 14,
                                          color: gray,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      CreditsWidget(crew: controller.crew),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 32),
                        child: CreditsWidget(
                          cast: controller.cast,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
