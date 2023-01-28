

import '../../model/now_playing_model.dart';
import '../../model/poular_model.dart';
import 'home_api_fetch.dart';

class HomeApiRepository {
  final _homeProvider = HomeApiProvider();

  Future<NowPlayingModel> fetchNowPlayingMovieList() {
    return _homeProvider.fetchNowShowingMovieList();
  }
  Future<PopularModel> fetchPopularMovieList() {
    return _homeProvider.fetchPopularMovieList();
  }
}

class HomeNowPlayingNetworkError extends Error {}
