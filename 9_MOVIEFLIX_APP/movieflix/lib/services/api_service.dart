import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieflix/models/movie_detail_model.dart';
import 'package:movieflix/models/movie_model.dart';

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";

  // getPopularMovies()는
  // 서버로 부터 Popular Movies에 대한 정보를 가져와서
  // 리스트로 반환하는 함수
  static Future<List<MovieModel>> getTargetedMovies(String target) async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseUrl/$target');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> movies = jsonDecode(response.body)["results"];

      for (var movie in movies) {
        movieInstances.add(MovieModel.fromJson(movie));
      }

      return movieInstances;
    }

    throw Error();
  }

  static Future<MovieDetailModel> getMovieById(int id) async {
    final url = Uri.parse('$baseUrl/movie?id=$id');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final dynamic movie = jsonDecode(response.body);

      return MovieDetailModel.fromJson(movie);
    }

    throw Error();
  }
}
