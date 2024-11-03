import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_detail_model.dart';
import 'package:movieflix/services/api_service.dart';

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
          elevation: 2, // 밑에 그림자
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              const Column(
                children: [
                  Text('Bohemian Rhapsody'),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("2h 14min"),
                      Text("|"),
                      Text("Biography, Drama, Music"),
                    ],
                  ),
                ],
              ),
              const Row(
                children: [
                  Column(
                    children: [
                      Text("StoryLine"),
                      SizedBox(
                        height: 20,
                      ),
                      Text("asdfasfasfdafdafafda"),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 200,
              ),
              Container(
                width: 300,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFf8d849),
                  borderRadius: BorderRadiusDirectional.circular(10),
                ),
                child: const Center(child: Text("Buy ticket")),
              ),
            ],
          ),
        ));
  }
}
