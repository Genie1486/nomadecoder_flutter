import 'package:flutter/material.dart';
import 'package:movieflix/enums/card_size.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:movieflix/widgets/large_movie_card.dart';
import 'package:movieflix/widgets/medium_movie_card.dart';

class MovieSection extends StatelessWidget {
  final String sectionTitle;
  final CardSize cardSize;
  final Future<List<MovieModel>> movies;

  const MovieSection({
    super.key,
    required this.sectionTitle,
    required this.cardSize,
    required this.movies,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 0, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sectionTitle,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              height: 1,
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          SizedBox(
            height: 190,
            child: FutureBuilder(
              future: movies,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return makeMovieList(snapshot);
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  ListView makeMovieList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        print(index);
        var movie = snapshot.data![index];

        if (cardSize == CardSize.large) {
          return LargeMovieCard(
            posterPath: movie.backDropPath,
          );
        }

        if (cardSize == CardSize.medium) {
          return MediumMovieCard(
            title: movie.title,
            posterPath: movie.backDropPath,
          );
        }

        return null;
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 15,
      ),
    );
  }
}
