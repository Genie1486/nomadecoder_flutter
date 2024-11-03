import 'package:flutter/material.dart';
import 'package:movieflix/enums/card_category.dart';

class LargeMovieCard extends StatelessWidget {
  final int id;
  final CardCategory cardCategory;
  final String posterPath;

  const LargeMovieCard({
    super.key,
    required this.id,
    required this.cardCategory,
    required this.posterPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Hero(
        tag: "${cardCategory.name}$id",
        child: SizedBox(
          width: 330,
          height: 230,
          child: Image.network(
            posterPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
