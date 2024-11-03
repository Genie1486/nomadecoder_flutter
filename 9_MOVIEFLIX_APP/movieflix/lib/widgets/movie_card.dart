import 'package:flutter/material.dart';
import 'package:movieflix/enums/card_category.dart';
import 'package:movieflix/screens/detail_screen.dart';
import 'package:movieflix/widgets/large_movie_card.dart';
import 'package:movieflix/widgets/medium_movie_card.dart';

class MovieCard extends StatelessWidget {
  final int id;
  final String title;
  final String posterPath;
  final CardCategory cardCategory;

  const MovieCard({
    super.key,
    required this.id,
    this.title = "",
    required this.posterPath,
    required this.cardCategory,
  });

  @override
  Widget build(BuildContext context) {
    Widget widget;

    switch (cardCategory) {
      case CardCategory.popularMovies:
        widget = LargeMovieCard(
          id: id,
          cardCategory: cardCategory,
          posterPath: posterPath,
        );
        break;
      case CardCategory.nowInCinemas || CardCategory.comingSoon:
        widget = MediumMovieCard(
          id: id,
          title: title,
          posterPath: posterPath,
          cardCategory: cardCategory,
        );
        break;
      default:
        widget = Container();
        break;
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => DetailScreen(
              id: id,
              posterPath: posterPath,
              type: "",
            ),
          ),
        );
      },
      child: widget,
    );
  }
}
