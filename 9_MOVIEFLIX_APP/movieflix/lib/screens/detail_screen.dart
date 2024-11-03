import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_detail_model.dart';
import 'package:movieflix/services/api_service.dart';
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
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
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
                  const Text(
                    'Bohemian Rhapsody',
                    style: TextStyle(
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
                        "2h 14min",
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
                          "Biography, Drama, Musicddddddddddddddddddddddddddddddddddddddd",
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
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "StoryLine",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 150,
                    child: Text(
                      "asddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd",
                      style: TextStyle(
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
      ),
    );
  }
}
