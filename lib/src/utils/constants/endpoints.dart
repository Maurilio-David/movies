const String baseUrl = 'https://api.themoviedb.org/3';

abstract class Endpoints {
  static const String popularMovies = '$baseUrl/movie/popular';
  static const String actionMovies =
      '$baseUrl/movie/popular?with_genres=28&language=pt-BR';
  static const String adventureMovies =
      '$baseUrl/movie/popular?with_genres=12&language=pt-BR';
  static const String fantasyMovies =
      '$baseUrl/movie/popular?with_genres=14&language=pt-BR';
  static const String comedyMovies =
      '$baseUrl/movie/popular?with_genres=35&language=pt-BR';
  static const String detailsMovies = '$baseUrl/movie';
  static const String image = 'https://image.tmdb.org/t/p/w220_and_h330_face';
}
