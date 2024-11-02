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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        height: 40,
        alignment: Alignment.centerLeft,
        child: const Text("Popular Movies"),
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

                  return Image.network(
                    movie.posterPath,
                    width: 350,
                    height: 217,
                    fit: BoxFit.cover,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  width: 40,
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      )
    ]);
  }
}
