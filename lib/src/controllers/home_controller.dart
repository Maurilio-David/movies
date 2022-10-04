import 'package:get/get.dart';
import 'package:movies/src/data/repository/home_repository.dart';
import 'package:movies/src/models/cast_model.dart';
import 'package:movies/src/models/crew_model.dart';
import 'package:movies/src/models/movie_model.dart';
import 'package:movies/src/models/movies_model.dart';

class HomeController extends GetxController {
  final RxInt label = 0.obs;
  final moviesActions = <Movies>[].obs;
  final detailsMoviesActions = <Movie>[].obs;
  final moviesAdventure = <Movies>[].obs;
  final detailsMoviesAdventure = <Movie>[].obs;
  final moviesFantasy = <Movies>[].obs;
  final detailsMoviesFantasy = <Movie>[].obs;
  final moviesComedy = <Movies>[].obs;
  final detailsMoviesComedy = <Movie>[].obs;
  final cast = <Cast>[].obs;
  final crew = <Crew>[].obs;
  HomeRepository homeRepository = HomeRepository();
  @override
  void onInit() {
    super.onInit();
    getAll();
  }

  getAll() {
    getMoviesAction();
    getMoviesAdventure();
    getMoviesComedy();
    getMoviesFantasy();
  }

  getMoviesAction() {
    homeRepository.getMoviesAction().then((value) {
      if (value.isNotEmpty) {
        moviesActions.clear();
        moviesActions.addAll(value);
        detailsMoviesActions.clear();
        for (Movies element in moviesActions) {
          homeRepository.detailsMoviesActions(element.id!).then((value) {
            detailsMoviesActions.add(value);
          });
        }
      }
    });
  }

  getMoviesAdventure() {
    homeRepository.getMoviesAdventure().then((value) {
      if (value.isNotEmpty) {
        moviesAdventure.clear();
        moviesAdventure.addAll(value);
        detailsMoviesAdventure.clear();
        for (Movies element in moviesAdventure) {
          homeRepository.detailsMoviesAdventure(element.id!).then((value) {
            detailsMoviesAdventure.add(value);
          });
        }
      }
    });
  }

  getMoviesFantasy() {
    homeRepository.getMoviesFantasy().then((value) {
      if (value.isNotEmpty) {
        moviesFantasy.clear();
        moviesFantasy.addAll(value);
        detailsMoviesFantasy.clear();
        for (Movies element in moviesFantasy) {
          homeRepository.detailsMoviesFantasy(element.id!).then((value) {
            detailsMoviesFantasy.add(value);
          });
        }
      }
    });
  }

  getMoviesComedy() {
    homeRepository.getMoviesComedy().then((value) {
      if (value.isNotEmpty) {
        moviesComedy.clear();
        moviesComedy.addAll(value);
        detailsMoviesComedy.clear();
        for (Movies element in moviesComedy) {
          homeRepository.detailsMoviesComedy(element.id!).then((value) {
            detailsMoviesComedy.add(value);
          });
        }
      }
    });
  }

  castMovie(int id) async {
    var res = await homeRepository.castMovie(id);
    var resultCast = getCast(res);
    var resultCrew = getCrew(res);

    resultCast.then((value) {
      if (value.isNotEmpty) {
        cast.clear();
        cast.addAll(value);
      }
    });

    resultCrew.then((value) {
      if (value.isNotEmpty) {
        crew.clear();
        crew.addAll(value);
      }
    });
  }

  Future<List<Cast>> getCast(dynamic list) async {
    List<Cast> cast = [];
    cast.clear();
    list['cast'].forEach((e) {
      cast.add(Cast.fromJson(e));
    });
    return cast;
  }

  Future<List<Crew>> getCrew(dynamic list) async {
    List<Crew> crew = [];
    List<Crew> director = [];
    crew.clear();
    list['crew'].forEach((e) {
      crew.add(Crew.fromJson(e));
    });
    for (Crew directors in crew) {
      if (directors.department == 'Directing') {
        director.add(directors);
      }
    }
    return director;
  }
}
