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
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  List<int> numbers = [];

  void onClicked() {
    setState(() {
      numbers.add(numbers.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text('nothing'),
              IconButton(
                onPressed: toggleTitle,
                icon: const Icon(Icons.remove_red_eye),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  // initState는 build 이전에 호출되는 메서드
  // build는 위젯에서 UI를 만들고
  // dispose는 위젯이 위젯트리에서 제거될 때 호출되는 메서드

  int count = 0;

  @override
  void initState() {
    // initState()는 build() 메서드 실행전에 한 번만 실행된다.
    // initState에서 변수를 초기화하고
    // API 업데이트를 구독할 수 있게 한다.
    super.initState();
    print('initState');
  }

  // dispose() 메서드는
  // 위젯이 스크린에서 제거될 때 호출되는 메서드
  // 무언가를 취소하고 싶을 때 사용
  // 이벤트 리스너 같은 것들을 구독취소 해준다.
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose!");
  }

  // 부모 요소에 접근하기를 원한다.
  @override
  Widget build(BuildContext context) {
    print('print');
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge!.color,
      ),
    );
  }
}
