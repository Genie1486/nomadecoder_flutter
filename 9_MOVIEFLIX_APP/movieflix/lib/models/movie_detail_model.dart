class MovieDetailModel {
  final String title, overview, backDropPath;
  final int runtime;
  final double voteAverage;
  final List<String> genres;

  static const String imageServerUrl = "https://image.tmdb.org/t/p/w500";

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        backDropPath = imageServerUrl + json['backdrop_path'],
        runtime = json["runtime"],
        overview = json["overview"],
        voteAverage = json["vote_average"],
        genres = [for (var genre in json["genres"]) genre["name"]];
}
