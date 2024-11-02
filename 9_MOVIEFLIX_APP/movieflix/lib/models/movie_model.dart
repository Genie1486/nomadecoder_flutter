class MovieModel {
  final int id;
  final String title, posterPath;

  final String imageServerUrl = "https://image.tmdb.org/t/p/w500";

  MovieModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        posterPath = json['poster_path'];
}
