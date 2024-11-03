import 'package:flutter/material.dart';
import 'package:movieflix/widgets/star_rating_widget.dart';

class MovieDetailView extends StatelessWidget {
  final int id, runtime;
  final double voteAverage;
  final String title, overview, backDropPath;
  final List<String> genres;

  const MovieDetailView({
    super.key,
    required this.id,
    required this.runtime,
    required this.voteAverage,
    required this.title,
    required this.overview,
    required this.backDropPath,
    required this.genres,
  });

  String formatRuntime(int runtime) {
    int hour = runtime ~/ 60;
    int min = runtime % 60;
    return "${hour == 0 ? "" : hour}h ${min}min";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(backDropPath), // 여기에 이미지 URL 입력
          fit: BoxFit.cover, // 이미지가 Container에 맞게 조정
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    StarRating(
                      rating: 9,
                      size: 24,
                      spacing: 7,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formatRuntime(runtime),
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Text("|",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white.withOpacity(0.8),
                          )),
                    ),
                    Expanded(
                      child: Text(
                        genres.join(", "),
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "StoryLine",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 150,
                  child: Text(
                    overview,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis, // 오버플로우 처리
                    maxLines: 7, // 최대 줄 수 설정
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFFf8d849),
                borderRadius: BorderRadiusDirectional.circular(15),
              ),
              child: const Center(
                  child: Text(
                "Buy ticket",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
