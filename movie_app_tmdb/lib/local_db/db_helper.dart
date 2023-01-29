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

  static Future<List<LocalDBModel>> getAllMovieId() async{
    final db = await open();
    final mapList = await db.query(tableMovie);
    return List.generate(mapList.length, (index) => LocalDBModel.fromMap(mapList[index]));
  }

}