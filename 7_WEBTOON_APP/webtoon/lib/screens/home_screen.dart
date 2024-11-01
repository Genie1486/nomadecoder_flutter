import 'package:flutter/material.dart';
import 'package:webtoon/models/webtoon_model.dart';
import 'package:webtoon/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // StatefulWidget의 State를 쓰지 않고
  // 1. Future 안의 데이터를 가져오고 싶다.
  // 2. Future의 로딩상태를 build 메서드에게 알리고 싶다.
  // 이 것을 해주는 Widget이 FutureBuilder Widget이다.
  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    print(webtoons);
    // Scaffold는 screen을 위한 기본적인 레이아웃과 설정을 제공
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2, // 밑에 그림자
        backgroundColor: Colors.white, // AppBar의 배경색
        foregroundColor: Colors.green, // AppBar의 글자색 설정
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      // FutureBuilder(future, builder)에서
      // FutureBuilder가 await future로 future의 값을 기다려 준다.
      // builder는 UI를 그려주는 함수
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          // snapshot을 이용하면 Future의 상태를 알 수 있다.
          if (snapshot.hasData) {
            return const Text("There is data!");
          }
          return const Text('Loading...');
        },
      ),
    );
  }
}
