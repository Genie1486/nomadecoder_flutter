import 'package:flutter/material.dart';
import 'package:movieflix/screens/detail_screen.dart';

class LargeMovieCard extends StatelessWidget {
  final int id;
  final String posterPath;
  final String type;

  const LargeMovieCard({
    super.key,
    required this.posterPath,
    required this.id,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
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
      child: Hero(
        tag: id,
        child: Container(
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
        ),
      ),
    );
  }
}
