import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_detail_model.dart';
import 'package:movieflix/services/api_service.dart';
import 'package:movieflix/widgets/movie_detail_view.dart';
import 'package:movieflix/widgets/star_rating_widget.dart';

class DetailScreen extends StatefulWidget {
  final int id;

  const DetailScreen({
    super.key,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<MovieDetailModel> movie;

  @override
  void initState() {
    super.initState();

    movie = ApiService.getMovieById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // AppBar의 배경색
        foregroundColor: Colors.white, // AppBar의 글자색 설정
        title: const Text(
          "Back to list",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios), // 원하는 아이콘으로 변경
            onPressed: () {
              Navigator.pop(context); // 이전 페이지로 돌아가기
            },
          ),
        ),
      ),
      extendBodyBehindAppBar: true, // 앱바 뒤에 배경 설정
      body: FutureBuilder(
        future: movie,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MovieDetailView(
                id: widget.id,
                runtime: snapshot.data!.runtime,
                voteAverage: snapshot.data!.voteAverage,
                title: snapshot.data!.title,
                overview: snapshot.data!.overview,
                backDropPath: snapshot.data!.backDropPath,
                genres: snapshot.data!.genres);
          }

          return Container();
        },
      ),
    );
  }
}
