import 'package:flutter/material.dart';
import 'package:movieflix/enums/card_category.dart';

class MediumMovieCard extends StatelessWidget {
  final int id;
  final String title;
  final String posterPath;
  final CardCategory cardCategory;

  const MediumMovieCard({
    super.key,
    required this.id,
    required this.title,
    required this.posterPath,
    required this.cardCategory,
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
            child: Hero(
              tag: "${cardCategory.name}$id",
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
        SizedBox(
          width: 160,
          child: Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
