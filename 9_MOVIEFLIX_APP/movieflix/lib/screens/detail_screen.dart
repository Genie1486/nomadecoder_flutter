import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2, // 밑에 그림자
        backgroundColor: Colors.transparent, // AppBar의 배경색
        foregroundColor: Colors.white, // AppBar의 글자색 설정
        title: const Text(
          "hello",
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
    );
  }
}
