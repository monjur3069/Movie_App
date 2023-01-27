class DetailsModel {
  String? error;
  DetailsModel({
      this.adult, 
      this.backdropPath, 
      this.belongsToCollection, 
      this.budget, 
      this.genres, 
      this.homepage, 
      this.id, 
      this.imdbId, 
      this.originalLanguage, 
      this.originalTitle, 
      this.overview, 
      this.popularity, 
      this.posterPath, 
      this.productionCompanies, 
      this.productionCountries, 
      this.releaseDate, 
      this.revenue, 
      this.runtime, 
      this.spokenLanguages, 
      this.status, 
      this.tagline, 
      this.title, 
      this.video, 
      this.voteAverage, 
      this.voteCount,});

  DetailsModel.withError(String errorMessage){
    error = errorMessage;

  }

  DetailsModel.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'] != null ? BelongsToCollection.fromJson(json['belongs_to_collection']) : null;
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = [];
      json['production_companies'].forEach((v) {
        productionCompanies?.add(ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = [];
      json['production_countries'].forEach((v) {
        productionCountries?.add(ProductionCountries.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = [];
      json['spoken_languages'].forEach((v) {
        spokenLanguages?.add(SpokenLanguages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
  bool? adult;
  String? backdropPath;
  BelongsToCollection? belongsToCollection;
  num? budget;
  List<Genres>? genres;
  String? homepage;
  num? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  String? releaseDate;
  num? revenue;
  num? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  num? voteAverage;
  num? voteCount;
DetailsModel copyWith({  bool? adult,
  String? backdropPath,
  BelongsToCollection? belongsToCollection,
  num? budget,
  List<Genres>? genres,
  String? homepage,
  num? id,
  String? imdbId,
  String? originalLanguage,
  String? originalTitle,
  String? overview,
  num? popularity,
  String? posterPath,
  List<ProductionCompanies>? productionCompanies,
  List<ProductionCountries>? productionCountries,
  String? releaseDate,
  num? revenue,
  num? runtime,
  List<SpokenLanguages>? spokenLanguages,
  String? status,
  String? tagline,
  String? title,
  bool? video,
  num? voteAverage,
  num? voteCount,
}) => DetailsModel(  adult: adult ?? this.adult,
  backdropPath: backdropPath ?? this.backdropPath,
  belongsToCollection: belongsToCollection ?? this.belongsToCollection,
  budget: budget ?? this.budget,
  genres: genres ?? this.genres,
  homepage: homepage ?? this.homepage,
  id: id ?? this.id,
  imdbId: imdbId ?? this.imdbId,
  originalLanguage: originalLanguage ?? this.originalLanguage,
  originalTitle: originalTitle ?? this.originalTitle,
  overview: overview ?? this.overview,
  popularity: popularity ?? this.popularity,
  posterPath: posterPath ?? this.posterPath,
  productionCompanies: productionCompanies ?? this.productionCompanies,
  productionCountries: productionCountries ?? this.productionCountries,
  releaseDate: releaseDate ?? this.releaseDate,
  revenue: revenue ?? this.revenue,
  runtime: runtime ?? this.runtime,
  spokenLanguages: spokenLanguages ?? this.spokenLanguages,
  status: status ?? this.status,
  tagline: tagline ?? this.tagline,
  title: title ?? this.title,
  video: video ?? this.video,
  voteAverage: voteAverage ?? this.voteAverage,
  voteCount: voteCount ?? this.voteCount,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    if (belongsToCollection != null) {
      map['belongs_to_collection'] = belongsToCollection?.toJson();
    }
    map['budget'] = budget;
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    map['homepage'] = homepage;
    map['id'] = id;
    map['imdb_id'] = imdbId;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    if (productionCompanies != null) {
      map['production_companies'] = productionCompanies?.map((v) => v.toJson()).toList();
    }
    if (productionCountries != null) {
      map['production_countries'] = productionCountries?.map((v) => v.toJson()).toList();
    }
    map['release_date'] = releaseDate;
    map['revenue'] = revenue;
    map['runtime'] = runtime;
    if (spokenLanguages != null) {
      map['spoken_languages'] = spokenLanguages?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['tagline'] = tagline;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

}

class SpokenLanguages {
  SpokenLanguages({
      this.englishName, 
      this.iso6391, 
      this.name,});

  SpokenLanguages.fromJson(dynamic json) {
    englishName = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }
  String? englishName;
  String? iso6391;
  String? name;
SpokenLanguages copyWith({  String? englishName,
  String? iso6391,
  String? name,
}) => SpokenLanguages(  englishName: englishName ?? this.englishName,
  iso6391: iso6391 ?? this.iso6391,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['english_name'] = englishName;
    map['iso_639_1'] = iso6391;
    map['name'] = name;
    return map;
  }

}

class ProductionCountries {
  ProductionCountries({
      this.iso31661, 
      this.name,});

  ProductionCountries.fromJson(dynamic json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }
  String? iso31661;
  String? name;
ProductionCountries copyWith({  String? iso31661,
  String? name,
}) => ProductionCountries(  iso31661: iso31661 ?? this.iso31661,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iso_3166_1'] = iso31661;
    map['name'] = name;
    return map;
  }

}

class ProductionCompanies {
  ProductionCompanies({
      this.id, 
      this.logoPath, 
      this.name, 
      this.originCountry,});

  ProductionCompanies.fromJson(dynamic json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }
  num? id;
  String? logoPath;
  String? name;
  String? originCountry;
ProductionCompanies copyWith({  num? id,
  String? logoPath,
  String? name,
  String? originCountry,
}) => ProductionCompanies(  id: id ?? this.id,
  logoPath: logoPath ?? this.logoPath,
  name: name ?? this.name,
  originCountry: originCountry ?? this.originCountry,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['logo_path'] = logoPath;
    map['name'] = name;
    map['origin_country'] = originCountry;
    return map;
  }

}

class Genres {
  Genres({
      this.id, 
      this.name,});

  Genres.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  num? id;
  String? name;
Genres copyWith({  num? id,
  String? name,
}) => Genres(  id: id ?? this.id,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}

class BelongsToCollection {
  BelongsToCollection({
      this.id, 
      this.name, 
      this.posterPath, 
      this.backdropPath,});

  BelongsToCollection.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
  }
  num? id;
  String? name;
  String? posterPath;
  String? backdropPath;
BelongsToCollection copyWith({  num? id,
  String? name,
  String? posterPath,
  String? backdropPath,
}) => BelongsToCollection(  id: id ?? this.id,
  name: name ?? this.name,
  posterPath: posterPath ?? this.posterPath,
  backdropPath: backdropPath ?? this.backdropPath,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['poster_path'] = posterPath;
    map['backdrop_path'] = backdropPath;
    return map;
  }

}