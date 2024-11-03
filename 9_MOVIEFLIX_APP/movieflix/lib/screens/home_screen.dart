import 'package:flutter/material.dart';
import 'package:movieflix/components/movie_section.dart';
import 'package:movieflix/enums/card_category.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:movieflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<MovieModel>> popularMovies =
      ApiService.getTargetedMovies("popular");

  final Future<List<MovieModel>> nowPlayingMovies =
      ApiService.getTargetedMovies("now-playing");

  final Future<List<MovieModel>> comingSoonMovies =
      ApiService.getTargetedMovies("coming-soon");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white, // Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MovieSection(
              cardCategory: CardCategory.popularMovies,
              movies: popularMovies,
            ),
            MovieSection(
              cardCategory: CardCategory.nowInCinemas,
              movies: nowPlayingMovies,
            ),
            MovieSection(
              cardCategory: CardCategory.comingSoon,
              movies: comingSoonMovies,
            ),
          ],
        ),
      ),
    );
  }
}
