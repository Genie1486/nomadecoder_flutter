import 'package:flutter/material.dart';
import 'package:movieflix/screens/detail_screen.dart';

class MediumMovieCard extends StatelessWidget {
  final int id;
  final String title, posterPath;
  final String type;

  const MediumMovieCard({
    super.key,
    required this.title,
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
              type: type,
              posterPath: posterPath,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.hardEdge,
            child: SizedBox(
              width: 160,
              height: 160,
              child: Hero(
                tag: "$id$type",
                child: Image.network(
                  posterPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            width: 160,
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
