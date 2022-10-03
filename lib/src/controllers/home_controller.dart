import 'package:get/get.dart';
import 'package:movies/src/data/repository/home_repository.dart';
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
}
