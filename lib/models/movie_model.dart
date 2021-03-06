import 'dart:convert';

class MovieModel {
  String? posterPath;
  String? releaseDate;
  String? title;
  double? voteAverage;
  MovieModel({
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'posterPath': posterPath,
      'releaseDate': releaseDate,
      'title': title,
      'voteAverage': voteAverage,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      posterPath:
          map['poster_path'] != null ? map['poster_path'] as String : null,
      releaseDate:
          map['release_date'] != null ? map['release_date'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      voteAverage: map['vote_average'] != null
          ? double.parse(map['vote_average'].toString())
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MovieModel(posterPath: $posterPath, releaseDate: $releaseDate, title: $title, voteAverage: $voteAverage)';
  }
}
