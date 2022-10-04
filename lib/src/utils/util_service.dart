import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:movies/src/models/cast_model.dart';
import 'package:movies/src/models/crew_model.dart';
import 'package:movies/src/models/genre_model.dart';
import 'package:movies/src/models/production_company_model.dart';
import 'package:movies/src/theme/app_theme.dart';

class UtilService {
  get gray2 => null;

  String durationToString(int minutes) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(
      1,
    )}h'
        '${parts[1].padLeft(2, '0')} min';
  }

  String getYear(DateTime date) {
    String year = DateFormat('yyyy').format(date);
    return year;
  }

  List<Widget> getGenres(List<Genres> genres) {
    final list = <Widget>[];
    for (int i = 0; i < genres.length; i++) {
      list.add(Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
        decoration: BoxDecoration(
            border: Border.all(color: gray4),
            borderRadius: BorderRadius.circular(8)),
        child: Text(
          '${genres[i].name}',
          style: GoogleFonts.montserrat(
              fontSize: 14, color: gray2, fontWeight: FontWeight.w600),
        ),
      ));
    }
    return list;
  }

  String formatMoeda(int valor) {
    String moeda;
    if (valor == 0) {
      return 'Indisponível';
    } else {
      moeda = NumberFormat("#,##0", "en_US").format(valor);
    }
    return moeda;
  }

  String producing(List<ProductionCompanies> companies) {
    String dados = '';
    if (companies.isEmpty) {
      return 'Indisponível';
    } else {
      for (int i = 0; i < companies.length; i++) {
        dados = dados + companies[i].name!;
        if (i != companies.length - 1) {
          dados = '$dados, ';
        }
      }
    }
    return dados;
  }

  String actors(List<Cast> cast) {
    String dados = '';
    if (cast.isEmpty) {
      return 'Indisponível';
    } else {
      for (int i = 0; i < cast.length; i++) {
        dados = dados + cast[i].name!;
        if (i != cast.length - 1) {
          dados = '$dados, ';
        }
      }
    }
    return dados;
  }

  String directors(List<Crew> crew) {
    String dados = '';
    if (crew.isEmpty) {
      return 'Indisponível';
    } else {
      for (int i = 0; i < crew.length; i++) {
        if (crew[i].department == 'Directing') {
          dados = dados + crew[i].name!;
          if (i != crew.length - 1) {
            dados = '$dados, ';
          }
        }
      }
    }
    return dados;
  }
}
