import 'package:movies/src/data/provider/home_provider.dart';
import 'package:movies/src/models/movie_model.dart';
import 'package:movies/src/models/movies_model.dart';

class HomeRepository {
  HomeProvider homeProvider = HomeProvider();

  //Search
  Future<List<Movies>> searchMovie(String query) async {
    List<Movies> search = [];
    search.clear();
    var res = await homeProvider.searchMovie(query);
    res.forEach((e) {
      search.add(Movies.fromJson(e));
    });

    return search;
  }

  Future<Movie> detailsSearch(int id) async {
    List<Movie> movie = [];
    var res = await homeProvider.detailsMovies(id);
    movie.clear();

    movie.add(Movie.fromJson(res));

    return movie[0];
  }

  //Action
  Future<List<Movies>> getMoviesAction() async {
    List<Movies> all = [];
    var res = await homeProvider.getMoviesAction();
    all.clear();
    res.forEach((e) {
      all.add(Movies.fromJson(e));
    });

    return all;
  }

  Future<Movie> detailsMoviesActions(int id) async {
    List<Movie> movie = [];
    var res = await homeProvider.detailsMovies(id);
    movie.clear();

    movie.add(Movie.fromJson(res));

    return movie[0];
  }

  //Adventure
  Future<List<Movies>> getMoviesAdventure() async {
    List<Movies> all = [];
    var res = await homeProvider.getMoviesAdventure();
    all.clear();
    res.forEach((e) {
      all.add(Movies.fromJson(e));
    });

    return all;
  }

  Future<Movie> detailsMoviesAdventure(int id) async {
    List<Movie> movie = [];
    var res = await homeProvider.detailsMovies(id);
    movie.clear();

    movie.add(Movie.fromJson(res));

    return movie[0];
  }

  //Fantasy
  Future<List<Movies>> getMoviesFantasy() async {
    List<Movies> all = [];
    var res = await homeProvider.getMoviesFantasy();
    all.clear();
    res.forEach((e) {
      all.add(Movies.fromJson(e));
    });

    return all;
  }

  Future<Movie> detailsMoviesFantasy(int id) async {
    List<Movie> movie = [];
    var res = await homeProvider.detailsMovies(id);
    movie.clear();

    movie.add(Movie.fromJson(res));

    return movie[0];
  }

  //Comedy
  Future<List<Movies>> getMoviesComedy() async {
    List<Movies> all = [];
    var res = await homeProvider.getMoviesComedy();
    all.clear();
    res.forEach((e) {
      all.add(Movies.fromJson(e));
    });

    return all;
  }

  Future<Movie> detailsMoviesComedy(int id) async {
    List<Movie> movie = [];
    var res = await homeProvider.detailsMovies(id);
    movie.clear();

    movie.add(Movie.fromJson(res));

    return movie[0];
  }

  Future<dynamic> castMovie(int id) async {
    var res = await homeProvider.getMovieCast(id);

    return res;
  }
}
