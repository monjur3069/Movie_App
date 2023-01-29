const String tableMovie = 'tbl_movie';
const String tableColId = 'id';
const String tableColMovieId = 'mId';
const String tableColMovieImage = 'image';
const String tableColMovieTitle = 'title';
const String tableColMovieGeners = 'geners';
const String tableColMovieRating = 'rating';
const String tableColMovieTime = 'time';

class LocalDBModel{
  int? id;
  int? mid;
  String? image;
  String? title;
  String? geners;
  String? rating;
  String? time;

  LocalDBModel({
    this.id,
    this.mid,
    this.image,
    this.title,
    this.geners,
    this.rating,
    this.time
  });

  Map<String,dynamic> toMap(){
    var map=<String,dynamic> {
      tableColMovieId :mid,
      tableColMovieImage : image,
      tableColMovieTitle : title,
      tableColMovieGeners : geners,
      tableColMovieRating : rating,
      tableColMovieTime : time
    };
    if(id!=null){
      map[tableColId]=id;
    }
    return map;
  }

  factory LocalDBModel.fromMap(Map<String,dynamic> map)=>LocalDBModel(
    mid: map[tableColMovieId],
    image: map[tableColMovieImage],
    title: map[tableColMovieTitle],
    geners: map[tableColMovieGeners],
    rating: map[tableColMovieRating],
    time: map[tableColMovieTime],
  );

  @override
  String toString() {
    return 'BookmarksModel{id: $id, movieId: $mid}';
  }
}