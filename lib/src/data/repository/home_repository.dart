import 'package:movies/src/data/provider/home_provider.dart';
import 'package:movies/src/models/all_movies_model.dart';
import 'package:movies/src/models/movie_model.dart';
import 'package:movies/src/models/movies_model.dart';

class HomeRepository {
  HomeProvider homeProvider = HomeProvider();
  Future<List<Movies>> getMoviesAction() async {
    List<Movies> all = [];
    var res = await homeProvider.getMoviesAction();
    all.clear();
    res.forEach((e) {
      all.add(Movies.fromJson(e));
    });

    return all;
  }

  Future<Movie> detailsMovies(int id) async {
    List<Movie> movie = [];
    var res = await homeProvider.detailsMovies(id);
    movie.clear();

    movie.add(Movie.fromJson(res));

    return movie[0];
  }
}
