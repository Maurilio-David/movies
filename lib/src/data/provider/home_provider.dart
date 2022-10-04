import 'package:movies/src/service/http_manager.dart';
import 'package:movies/src/utils/constants/constants.dart';
import 'package:movies/src/utils/constants/endpoints.dart';

class HomeProvider {
  HttpManager httpManager = HttpManager();
  //Search
  Future<dynamic> searchMovie(String query) async {
    final result = await httpManager.restRequest(
      url: '${Endpoints.search}=$query',
      method: HttpMethods.get,
      headers: {'Authorization': 'Bearer ${Constants.key}'},
    );
    return result['results'];
  }

  //Actions
  Future<dynamic> getMoviesAction() async {
    final result = await httpManager.restRequest(
      url: Endpoints.actionMovies,
      method: HttpMethods.get,
      headers: {'Authorization': 'Bearer ${Constants.key}'},
    );
    return result['results'];
  }

  //Details
  Future<dynamic> detailsMovies(int id) async {
    final result = await httpManager.restRequest(
      url: '${Endpoints.detailsMovies}/$id?language=pt-BR',
      method: HttpMethods.get,
      headers: {'Authorization': 'Bearer ${Constants.key}'},
    );
    return result;
  }

  //Adventure
  Future<dynamic> getMoviesAdventure() async {
    final result = await httpManager.restRequest(
      url: Endpoints.adventureMovies,
      method: HttpMethods.get,
      headers: {'Authorization': 'Bearer ${Constants.key}'},
    );
    return result['results'];
  }

  //Fantasy
  Future<dynamic> getMoviesFantasy() async {
    final result = await httpManager.restRequest(
      url: Endpoints.fantasyMovies,
      method: HttpMethods.get,
      headers: {'Authorization': 'Bearer ${Constants.key}'},
    );
    return result['results'];
  }

  //Comedy
  Future<dynamic> getMoviesComedy() async {
    final result = await httpManager.restRequest(
      url: Endpoints.comedyMovies,
      method: HttpMethods.get,
      headers: {'Authorization': 'Bearer ${Constants.key}'},
    );
    return result['results'];
  }

  //Cast
  Future<dynamic> getMovieCast(int id) async {
    final result = await httpManager.restRequest(
      url: '${Endpoints.detailsMovies}/$id/credits?language=pt-BR',
      method: HttpMethods.get,
      headers: {'Authorization': 'Bearer ${Constants.key}'},
    );
    return result;
  }
}
