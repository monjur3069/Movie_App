import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';

import '../model/poular_model.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://api.themoviedb.org/3/movie/popular?api_key=1b11a9f6356e930cb7542b3606c403f9&language=en-US&page=1';

  Future<PopularModel> fetchPopularMovieList() async {
    try {
      Response response = await _dio.get(_url);
      return PopularModel.fromJson(response.data);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occured: $error stackTrace: $stacktrace");
      }
      return PopularModel.withError("Data not found / Connection issue");
    }
  }
}
