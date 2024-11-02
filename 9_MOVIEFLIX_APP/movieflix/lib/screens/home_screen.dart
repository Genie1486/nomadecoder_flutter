import 'package:flutter/material.dart';
import 'package:movieflix/components/movie_section.dart';
import 'package:movieflix/enums/card_size.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:movieflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<MovieModel>> popularMovies = ApiService.getPopularMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue, // Colors.white,
        title: const Text("MovieFlix"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MovieSection(
              sectionTitle: "Popular Movies",
              cardSize: CardSize.large,
              movies: popularMovies,
            ),
            MovieSection(
              sectionTitle: "Now in Cinemas",
              cardSize: CardSize.medium,
              movies: popularMovies,
            ),
          ],
        ),
      ),
    );
  }
}
