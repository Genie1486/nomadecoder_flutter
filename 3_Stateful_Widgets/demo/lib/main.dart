import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

// st 라고 입력하면
// Stateful, Stateless 위젯을 자동완성할 수 있다.

// Stateful Widget은 두 가지 부분으로 구성되어 있다.
// Part1 : Widget
// Part2 : State (데이터와 UI)

// Part1 : Widget 그 자체
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

// Part2: State(우리가 UI를 구축하는 곳)
// 위젯의 데이터와 UI를 저장하고
// 우리가 State의 데이터를 바꿀 때
// 우리의 UI는 새로고침 되면서 최신 데이터를 보여준다.
// Stateful Widget의 데이터는 simple dart 클래스 프로퍼티이다.
class _AppState extends State<App> {
  List<int> numbers = [];

  void onClicked() {
    setState(() {
      numbers.add(numbers.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Click Count',
                style: TextStyle(fontSize: 30),
              ),
              for (var n in numbers) Text('$n'),
              IconButton(
                iconSize: 40,
                onPressed: onClicked,
                icon: const Icon(Icons.add_box_rounded),
              )
            ],
          ),
        ),
      ),
    );
  }
}
