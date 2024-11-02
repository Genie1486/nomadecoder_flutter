import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:movieflix/services/api_service.dart';

class MovieSection extends StatelessWidget {
  MovieSection({super.key});

  final Future<List<MovieModel>> movies = ApiService.getPopularMovies();

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 50,
          alignment: Alignment.topLeft,
          child: const Text(
            "Popular Movies",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: FutureBuilder(
            future: movies,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    print(index);
                    var movie = snapshot.data![index];

                    return Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(
                        movie.posterPath,
                        width: 330,
                        height: 230,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 15,
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        )
      ]),
    );
  }
}
