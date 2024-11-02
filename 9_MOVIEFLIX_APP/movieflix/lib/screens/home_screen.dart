import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:movieflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<MovieModel>> movies = ApiService.getPopularMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue, // Colors.white,
          title: const Text("MovieFlix"),
        ),
        body: FutureBuilder(
          future: movies,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  for (var movie in snapshot.data!) Text(movie.title),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
