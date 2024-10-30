import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold는 screen을 위한 기본적인 레이아웃과 설정을 제공
    return Scaffold(
      appBar: AppBar(
        title: const Text("Today's 툰s"),
      ),
    );
  }
}
