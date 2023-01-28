import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';

import '../model/bookmarks_model.dart';


class BookmarksApiProvider {
  final Dio _dio = Dio();

  Future<BookmarksModel> fetchBookmarksMovieList(String? id) async {
    final String _detailsurl = 'https://api.themoviedb.org/3/movie/${id}?api_key=1b11a9f6356e930cb7542b3606c403f9&language=en-US';
    try {
      Response response = await _dio.get(_detailsurl);
      return BookmarksModel.fromJson(response.data);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occured: $error stackTrace: $stacktrace");
      }
      return BookmarksModel.withError("Data not found / Connection issue");
    }
  }


}
