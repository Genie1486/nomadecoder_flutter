class MovieModel {
  final int id;
  final String title, posterPath;

  static const String imageServerUrl = "https://image.tmdb.org/t/p/w500";

  MovieModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        posterPath = imageServerUrl + json['poster_path'];
}
