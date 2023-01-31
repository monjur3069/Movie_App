import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../local_db_model/local_db_model.dart';


class DBHelper{
  static const String createTableMovie='''
  create table $tableMovie(
  $tableColId integer primary key,
  $tableColMovieId integer,
  $tableColMovieImage String,
  $tableColMovieTitle String,
  $tableColMovieGeners String,
  $tableColMovieRating String,
  $tableColMovieTime String
  )
  ''';

  static Future<Database> open() async{
    final rootPath = await getDatabasesPath();
    final dbPath =join(rootPath,'movie.db');

    return openDatabase(dbPath,version: 1,onCreate:(db,version){
      db.execute(createTableMovie);
    } );
  }
  static Future<int> insertMovieId(LocalDBModel localDBModel) async{
    final db = await open();
    print(localDBModel.title);
    print(localDBModel.time);
    print(localDBModel.rating);
    print(localDBModel.image);
    print(localDBModel.geners);
    return db.insert(tableMovie, localDBModel.toMap());
  }

  static Future<List<LocalDBModel>> getAllMovieDetails1() async{
    final db = await open();
    List<Map<String,dynamic>> maps = await db.rawQuery('select * from tbl_movie');
    var s = List.generate(maps.length, (i) {
      return LocalDBModel(
        mid: maps[i]['mId'],
        title: maps[i]['title'],
        rating: maps[i]['rating'],
        geners: maps[i]['geners'],
        time: maps[i]['time'],
        image: maps[i]['image'],
      );
    });

    return s;
  }

  static Future<List<LocalDBModel>> getAllMovieDetails() async{
    final db = await open();
    var mapList = await db.query(tableMovie);
    return List.generate(mapList.length, (index) => LocalDBModel.fromMap(mapList[index]));
  }

  static Future<int> deleteMovieList(int id) async {
    final db = await open();
    return db
        .delete(tableMovie, where: '$tableColMovieId = ?', whereArgs: [id]);
  }

}