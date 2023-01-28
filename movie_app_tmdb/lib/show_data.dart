import 'package:flutter/material.dart';
import 'package:movie_app_tmdb/bookmarks/model/bookmarks_model.dart';
import 'package:movie_app_tmdb/local_db/db_helper.dart';

class ShowData extends StatefulWidget {
  const ShowData({Key? key}) : super(key: key);

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {

  List<BookmarksModel> movieList = [];

  @override
  void initState() {
    DBHelper.getAllMovieId();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: movieList.length,
          itemBuilder: (context,index){
          final movieId = movieList[index];
          return Text(movieId.toString());
          }),
    );
  }
}
