
import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/details/model/details_model.dart';
import 'package:movie_app_tmdb/home/UI/pages/home_page.dart';
import 'package:movie_app_tmdb/local_db/db_helper.dart';
import 'package:movie_app_tmdb/local_db_model/local_db_model.dart';

String durationToString(num? minutes) {
  var d = Duration(minutes: int.parse(minutes.toString()));
  List<String> parts = d.toString().split(':');
  return '${parts[0].padLeft(2, '0')}h ${parts[1].padLeft(2, '0')}min';
}

insertData(BuildContext context,String? id, String image, String title, String rating, String time, List<Genres> genersList) async{
  final Id = int.parse(id!);
  StringBuffer genersList1 = StringBuffer();
  for(var value in genersList){
    genersList1.write("${value.name.toString()},");
  }
  //print(Id);
  final movie = LocalDBModel(mid: Id,image: image.toString(),title: title.toString(),rating: rating.toString(),time: time.toString(),geners: genersList1.toString());
  //print(movieId.toString());
  final rowId = await DBHelper.insertMovieId(movie);
  if(rowId>0){
    movie.id = rowId;
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  }
  else{

  }
}

