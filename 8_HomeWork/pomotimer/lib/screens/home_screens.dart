import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomotimer/screens/rectangle.dart';
import 'package:pomotimer/screens/time_selection_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500;
  int totalSeconds = twentyFiveMinutes; // 25분을 초로 환산
  bool isRunning = false;
  int totalPomodoros = 0;
  int selectedMinutes = 25;

  // Timer를 통해 정해진 간격에 한번씩 함수를 실행할 수 있다.
  // late modifier를 써서 나중에 초기화한다고 약속함
  late Timer timer;

  // onTick함수는 시간이 흐르도록 보이게 하기 위해
  // 1초 마다 totalSeconds에서 1을 빼고
  // UI를 업데이트 하는 역할을 한다.
  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros = totalPomodoros + 1;
        isRunning = false;
        totalSeconds = twentyFiveMinutes;
      });
      timer.cancel();
    } else {
      // setState는 상태가 변경되었음을 Flutter에게 알리는 메서드
      // 이 메서드를 호출하면 Flutter는 해당 위젯과 그 자식 위젯들을 다시 그려야 한다고 판단하고
      // UI를 업데이트 합니다.
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onStartPressed() {
    // Timer.periodic(duration, callback)은
    // duration 마다 callback 함수를 실행한다.
    // 여기서는 1초마다 onTick 함수를 실행하도록 지정
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );

    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onResetPressed() {
    setState(() {
      totalSeconds = twentyFiveMinutes;
      isRunning = false;
    });
    timer.cancel();
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          titleTextStyle: Theme.of(context).textTheme.displaySmall,
          title: const Text('POMOTIMER'),
        ),
        body: Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(75, 0, 75, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Rectangle(
                          width: 110,
                          height: 150,
                          content: format(totalSeconds).split(":")[0],
                        ),
                        Text(
                          ':',
                          style: TextStyle(
                            color: Theme.of(context).cardColor.withOpacity(0.3),
                            fontSize: 89,
                          ),
                        ),
                        Rectangle(
                          width: 110,
                          height: 150,
                          content: format(totalSeconds).split(":")[1],
                        ),
                      ],
                    ),
                  )),
            ),
            Flexible(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal, // 가로 스크롤 설정
                child: Row(
                  children: [
                    for (var minute in [15, 20, 25, 30, 35])
                      TimeSelectionCard(minute: minute)
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(50)),
                        child: IconButton(
                          iconSize: 50,
                          onPressed:
                              isRunning ? onPausePressed : onStartPressed,
                          icon: Icon(
                            isRunning ? Icons.pause : Icons.play_arrow,
                            color: Theme.of(context).cardColor,
                          ),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(50)),
                        child: IconButton(
                          iconSize: 60,
                          color: Theme.of(context).cardColor,
                          onPressed: onResetPressed,
                          icon: const Icon(Icons.stop),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '0/4',
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .fontSize,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .color!
                                  .withOpacity(0.5),
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .fontWeight,
                              height: 2,
                            ),
                          ),
                          Text(
                            'ROUND',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '0/12',
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .fontSize,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .color!
                                  .withOpacity(0.5),
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .fontWeight,
                              height: 2,
                            ),
                          ),
                          Text(
                            'GOAL',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
