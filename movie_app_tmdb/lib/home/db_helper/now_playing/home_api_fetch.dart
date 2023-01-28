import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';

import '../../model/now_playing_model.dart';
import '../../model/poular_model.dart';

class HomeApiProvider {
  final Dio _dio = Dio();
  final String _nowplayingurl = 'https://api.themoviedb.org/3/movie/now_playing?api_key=1b11a9f6356e930cb7542b3606c403f9&language=en-US&page=1';
  final String _popular = 'https://api.themoviedb.org/3/movie/popular?api_key=1b11a9f6356e930cb7542b3606c403f9&language=en-US&page=1';

  Future<NowPlayingModel> fetchNowShowingMovieList() async {
    try {
      Response response = await _dio.get(_nowplayingurl);
      return NowPlayingModel.fromJson(response.data);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occured: $error stackTrace: $stacktrace");
      }
      return NowPlayingModel.withError("Data not found / Connection issue");
    }
  }

  Future<PopularModel> fetchPopularMovieList() async {
    try {
      Response response = await _dio.get(_popular);
      return PopularModel.fromJson(response.data);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occured: $error stackTrace: $stacktrace");
      }
      return PopularModel.withError("Data not found / Connection issue");
    }
  }

}
