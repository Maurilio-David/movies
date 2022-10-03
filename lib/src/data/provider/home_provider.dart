import 'package:movies/src/models/movie_model.dart';
import 'package:movies/src/service/http_manager.dart';
import 'package:movies/src/utils/constants/constants.dart';
import 'package:movies/src/utils/constants/endpoints.dart';

class HomeProvider {
  HttpManager httpManager = HttpManager();
  Future<dynamic> getMoviesAction() async {
    final result = await httpManager.restRequest(
      url: Endpoints.actionMovies,
      method: HttpMethods.get,
      headers: {'Authorization': 'Bearer ${Constants.key}'},
    );
    return result['results'];
  }

  Future<dynamic> detailsMovies(int id) async {
    final result = await httpManager.restRequest(
      url: '${Endpoints.detailsMovies}/$id?language=pt-BR',
      method: HttpMethods.get,
      headers: {'Authorization': 'Bearer ${Constants.key}'},
    );
    return result;
  }
}
