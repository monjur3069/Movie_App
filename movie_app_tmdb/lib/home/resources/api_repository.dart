
import '../model/poular_model.dart';
import 'api_fetch.dart';


class ApiRepository {
  final _provider = ApiProvider();

  Future<PopularModel> fetchPopularMovieList() {
    return _provider.fetchPopularMovieList();
  }
}

class NetworkError extends Error {}
