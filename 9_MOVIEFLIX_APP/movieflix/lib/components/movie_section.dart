import 'package:flutter/material.dart';
import 'package:movieflix/enums/card_category.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:movieflix/widgets/large_movie_card.dart';
import 'package:movieflix/widgets/movie_card.dart';

class MovieSection extends StatelessWidget {
  final CardCategory cardCategory;
  final Future<List<MovieModel>> movies;

  const MovieSection({
    super.key,
    required this.cardCategory,
    required this.movies,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 0, 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cardCategory.value,
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
            height: 206,
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

        return MovieCard(
          id: movie.id,
          title: movie.title,
          posterPath: movie.posterPath,
          cardCategory: cardCategory,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 15,
      ),
    );
  }
}
