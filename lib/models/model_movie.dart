class MovieModel {
  String backDropPath;
  String originalTitle;
  String overView;
  String posterPath;
  String releaseDate;

  MovieModel({
    required this.originalTitle,
    required this.backDropPath,
    required this.overView,
    required this.posterPath,
    required this.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        originalTitle: json["original_title"],
        backDropPath: json["backdrop_path"],
        overView: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: json["release_date"]);
  }
}














/* adult	false
backdrop_path	"/rSPw7tgCH9c6NqICZef4kZjFOQ5.jpg"
genre_ids	
0	18
1	80
id	238
original_language	"en"
original_title	"The Godfather"
overview	"Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge."
popularity	156.255
poster_path	"/3bhkrj58Vtu7enYsRolD1fZdja1.jpg"
release_date	"1972-03-14"
title	"The Godfather"
video	false
vote_average	8.7
vote_count	18441 */