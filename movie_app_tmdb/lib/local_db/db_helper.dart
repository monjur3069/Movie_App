import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../local_db_model/bookmarks_model.dart';


class DBHelper{
  static const String createTableMovie='''
  create table $tableMovie(
  $tableColId integer primary key,
  $tableColMovieId integer
  )
  ''';

  static Future<Database> open() async{
    final rootPath = await getDatabasesPath();
    final dbPath =join(rootPath,'movie.db');

    return openDatabase(dbPath,version: 1,onCreate:(db,version){
      db.execute(createTableMovie);
    } );
  }
  static Future<int> insertMovieId(LocalDBModel bookmarksModel) async{
    final db = await open();
    return db.insert(tableMovie, bookmarksModel.toMap());
  }

  static Future<List<LocalDBModel>> getAllMovieId() async{
    final db = await open();
    final mapList = await db.query(tableMovie);
    return List.generate(mapList.length, (index) => LocalDBModel.fromMap(mapList[index]));
  }

}