import 'package:flutter/material.dart';

class MediumMovieCard extends StatelessWidget {
  final String title, posterPath;

  const MediumMovieCard({
    super.key,
    required this.title,
    required this.posterPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          clipBehavior: Clip.hardEdge,
          child: SizedBox(
            width: 160,
            height: 160,
            child: Image.network(
              posterPath,
              fit: BoxFit.cover,
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
              fontSize: 100,
              fontWeight: FontWeight.w600,
            ),
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
