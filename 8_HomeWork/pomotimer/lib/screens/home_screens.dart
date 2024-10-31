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
  int round = 0;
  int goal = 0;

  final ScrollController _scrollController = ScrollController();
  final List<int> choicePossibleMinutes = [
    15,
    20,
    25,
    30,
    35,
  ];

  // Timer를 통해 정해진 간격에 한번씩 함수를 실행할 수 있다.
  // late modifier를 써서 나중에 초기화한다고 약속함
  Timer? timer;

  // onTick함수는 시간이 흐르도록 보이게 하기 위해
  // 1초 마다 totalSeconds에서 1을 빼고
  // UI를 업데이트 하는 역할을 한다.
  void onTick(Timer timer) {
    if (totalSeconds > 1) {
      totalSeconds = 2;
    }

    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros = totalPomodoros + 1;
        isRunning = false;
        totalSeconds = twentyFiveMinutes;
        round += 1;
        if (round == 4) {
          goal += 1;
          round = 0;
        }
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
    setState(() {
      isRunning = false;
    });
    timer?.cancel();
  }

  void onResetPressed() {
    setState(() {
      totalSeconds = selectedMinutes * 60;
      isRunning = false;
    });
    timer?.cancel();
  }

  void onSetMinutes(int index) {
    setState(() {
      selectedMinutes = choicePossibleMinutes[index];
      totalSeconds = selectedMinutes * 60;
      isRunning = false;
    });
    _scrollToCard(index);
    timer?.cancel();
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2, 7);
  }

  void _scrollToCard(int index) {
    // 카드의 위치 계산
    const double cardWidth = 105; // 카드 너비
    final double screenWidth = MediaQuery.of(context).size.width; // 화면 너비
    final double offset =
        160 + cardWidth / 2 - screenWidth / 2 + (index * cardWidth);

    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToCard(choicePossibleMinutes.indexOf(selectedMinutes)); // 빌드 후 스크롤
    });
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
                controller: _scrollController,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 160,
                    ),
                    for (int i = 0; i < choicePossibleMinutes.length; i++)
                      GestureDetector(
                        onTap: () {
                          onSetMinutes(i);
                        },
                        child: TimeSelectionCard(
                          minute: choicePossibleMinutes[i],
                          isSelected:
                              choicePossibleMinutes[i] == selectedMinutes,
                        ),
                      ),
                    const SizedBox(
                      width: 160,
                    ),
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
                            '$round/4',
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
                            '$goal/12',
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
