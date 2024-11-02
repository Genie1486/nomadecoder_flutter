import 'package:flutter/material.dart';

class LargeMovieCard extends StatelessWidget {
  final String posterPath;

  const LargeMovieCard({
    super.key,
    required this.posterPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: 330,
        height: 230,
        child: Image.network(
          posterPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
