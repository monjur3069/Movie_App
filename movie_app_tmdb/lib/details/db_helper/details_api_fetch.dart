import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';

import '../model/details_model.dart';


class DetailsApiProvider {
  final Dio _dio = Dio();
   //static String? mId;
  //final String _detailsurl = 'https://api.themoviedb.org/3/movie/${mId}?api_key=1b11a9f6356e930cb7542b3606c403f9&language=en-US';
  //final String _detailsurl = 'https://api.themoviedb.org/3/movie/536554?api_key=1b11a9f6356e930cb7542b3606c403f9&language=en-US';

  Future<DetailsModel> fetchDetailsMovieList(String? id) async {
    final String _detailsurl = 'https://api.themoviedb.org/3/movie/${id}?api_key=1b11a9f6356e930cb7542b3606c403f9&language=en-US';
    try {
      Response response = await _dio.get(_detailsurl);
      return DetailsModel.fromJson(response.data);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occured: $error stackTrace: $stacktrace");
      }
      return DetailsModel.withError("Data not found / Connection issue");
    }
  }


}
