import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSeconds = 1500; // 25분을 초로 환산

  // Timer를 통해 정해진 간격에 한번씩 함수를 실행할 수 있다.
  // late modifier를 써서 나중에 초기화한다고 약속함
  late Timer timer;

  // onTick함수는 시간이 흐르도록 보이게 하기 위해
  // 1초 마다 totalSeconds에서 1을 빼고
  // UI를 업데이트 하는 역할을 한다.
  void onTick(Timer timer) {
    // setState는 상태가 변경되었음을 Flutter에게 알리는 메서드
    // 이 메서드를 호출하면 Flutter는 해당 위젯과 그 자식 위젯들을 다시 그려야 한다고 판단하고
    // UI를 업데이트 합니다.
    setState(() {
      totalSeconds = totalSeconds - 1;
    });
  }

  void onStartPressed() {
    // Timer.periodic(duration, callback)은
    // duration 마다 callback 함수를 실행한다.
    // 여기서는 1초마다 onTick 함수를 실행하도록 지정
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: deprecated_member_use
      backgroundColor: Theme.of(context).colorScheme.background,
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
            child: Container(
                // alignment: Alignment.bottomCenter
                // Container가 차지하는 영역의
                // 아래쪽 가운데에 child Widget을 위치
                alignment: Alignment.bottomCenter,
                child: Text(
                  '$totalSeconds',
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 89,
                    fontWeight: FontWeight.w600,
                  ),
                )),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: IconButton(
                iconSize: 120,
                color: Theme.of(context).cardColor,
                onPressed: onStartPressed,
                icon: const Icon(Icons.play_circle_fill_outlined),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodors',
                          style: TextStyle(
                            fontSize: 20,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                        Text(
                          '0',
                          style: TextStyle(
                            fontSize: 58,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
