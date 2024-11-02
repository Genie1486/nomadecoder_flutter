class MovieModel {
  final int id;
  final String title, backDropPath;

  static const String imageServerUrl = "https://image.tmdb.org/t/p/w500";

  MovieModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        backDropPath = imageServerUrl + json['backdrop_path'];
}
