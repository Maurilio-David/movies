import 'package:get/get.dart';
import 'package:movies/src/data/repository/home_repository.dart';
import 'package:movies/src/models/movie_model.dart';
import 'package:movies/src/models/movies_model.dart';

class HomeController extends GetxController {
  final RxInt label = 0.obs;
  final allMovies = <Movies>[].obs;
  final detailsMovies = <Movie>[].obs;
  HomeRepository homeRepository = HomeRepository();
  @override
  void onInit() {
    super.onInit();
    getMoviesAction();
  }

  getMoviesAction() {
    homeRepository.getMoviesAction().then((value) {
      if (value.isNotEmpty) {
        allMovies.clear();
        allMovies.addAll(value);
        print(allMovies[0]);
        detailsMovies.clear();
        for (Movies element in allMovies) {
          homeRepository.detailsMovies(element.id!).then((value) {
            detailsMovies.add(value);
          });

          print(element.id);
        }
      } else {
        print('A lista veio vazia');
      }
    });
  }
}
