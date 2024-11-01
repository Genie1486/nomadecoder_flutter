import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webtoon/screens/home_screen.dart';

class MyHttpOverrides extends HttpOverrides {
  // HTTP 요청할 때
  // 헤더에 userAgent 붙여주도록 설정
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..userAgent =
          'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36';
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const App());
}

class App extends StatelessWidget {
  // Widget은 key라는 것을 가지고 있고
  // 이 key를 ID처럼 사용한다.

  // 이 Widget의 key를
  // StatelessWidget이라는 super classd에게 보내는 부분
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
