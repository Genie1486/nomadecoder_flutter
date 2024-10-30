import 'package:flutter/material.dart';

void main() {
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
      home: Container(),
    );
  }
}
