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
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: const Scaffold(
        backgroundColor: Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyLargeTitle(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatelessWidget {
  const MyLargeTitle({
    super.key,
  });

  // 부모 요소에 접근하기를 원한다.
  // 이거를 하기 위해서 BuildContext를 이용

  // BuildContext는
  // 위젯트리에서 위젯의 위치를 제공하고
  // 이를 통해서 상위요소의 데이터에 접근할 수 있다.

  // context는 Text 이전에 있는 모든 상위 요소들에 대한 정보
  // context는 MyLargeTitle Text의 부모 요소들의 모든 정보를 담고 있다.
  @override
  Widget build(BuildContext context) {
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge!.color,
      ),
    );
  }
}
