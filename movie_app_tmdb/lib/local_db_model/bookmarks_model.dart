const String tableMovie = 'tbl_movie';
const String tableColId = 'id';
const String tableColMovieId = 'mid';

class LocalDBModel{
  int? id;
  int? mid;

  LocalDBModel({
    this.id,
    this.mid
  });

  Map<String,dynamic> toMap(){
    var map=<String,dynamic> {
      tableColMovieId :mid,
    };
    if(id!=null){
      map[tableColId]=id;
    }
    return map;
  }

  factory LocalDBModel.fromMap(Map<String,dynamic> map)=>LocalDBModel(
    mid: map[tableColMovieId],
  );

  @override
  String toString() {
    return 'BookmarksModel{id: $id, movieId: $mid}';
  }
}