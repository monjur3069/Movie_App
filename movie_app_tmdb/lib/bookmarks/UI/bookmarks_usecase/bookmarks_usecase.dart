import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/bookmarks/UI/pages/bookmarks_page.dart';

import '../../../local_db/db_helper.dart';

String durationToString(num? minutes) {
  var d = Duration(minutes: int.parse(minutes.toString()));
  List<String> parts = d.toString().split(':');
  return '${parts[0].padLeft(2, '0')}h ${parts[1].padLeft(2, '0')}min';
}

deleteItemFromMovieList(BuildContext context,int mid) async{
  await DBHelper.deleteMovieList(mid);
  Navigator.pop(context);
  Navigator.push(context, MaterialPageRoute(builder: (context) => BookmarksPage()));

}
