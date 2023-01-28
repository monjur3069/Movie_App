
import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/home/UI/pages/home_page.dart';
import 'package:movie_app_tmdb/local_db/db_helper.dart';
import 'package:movie_app_tmdb/local_db_model/bookmarks_model.dart';
import 'package:movie_app_tmdb/show_data.dart';

String durationToString(num? minutes) {
  var d = Duration(minutes: int.parse(minutes.toString()));
  List<String> parts = d.toString().split(':');
  return '${parts[0].padLeft(2, '0')}h ${parts[1].padLeft(2, '0')}min';
}

insertData(BuildContext context,String? id) async{
  final Id = int.parse(id!);
  //print(Id);
  final movie = LocalDBModel(mid: Id);
  //print(movieId.toString());
  final rowId = await DBHelper.insertMovieId(movie);
  if(rowId>0){
    movie.id = rowId;
    Navigator.push(context, MaterialPageRoute(builder: (context) => ShowData()));
  }
  else{

  }
}

