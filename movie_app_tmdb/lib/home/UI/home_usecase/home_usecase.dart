import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/local_db/db_helper.dart';
import 'package:movie_app_tmdb/local_db_model/local_db_model.dart';

import '../../../bookmarks/UI/pages/bookmarks_page.dart';
import '../../../details/UI/details_page.dart';

detailsPage(BuildContext context, String movieId) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              DetailsPage(movieId)));
}

bookmarksPage(BuildContext context) {
  List<LocalDBModel> movieList = [];

  getAllMovieList() async{
    movieList = await DBHelper.getAllMovieDetails();
  }

  Navigator.push(context, MaterialPageRoute(builder: (context) => BookmarksPage()));
}
