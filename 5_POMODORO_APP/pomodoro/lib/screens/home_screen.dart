import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Flexible :
          // - 높이가 200픽셀, 너비가 100픽셀 이런 식으로
          // - 하드 코딩하지 않고
          // - UI를 비율에 기반해서 더 유연하게 만들 수 있게 해줌
          Flexible(
            // Flexible Widget에서
            // flex 값을 통해
            // 하나의 박스가 얼마나 공간을 차지하 지
            // 비율을 정할 수 있다.
            flex: 1,
            child: Container(),
          ),
          Flexible(
            flex: 2,
            child: Container(),
          ),
          Flexible(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
