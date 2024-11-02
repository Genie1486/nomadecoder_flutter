import 'package:flutter/material.dart';
import 'package:todo/widgets/date_calculator.dart';

class SelectDay extends StatefulWidget {
  final int today = DateCalculator().getDay();
  final int lastDayOfMonth = 31;
  SelectDay({super.key});

  @override
  State<SelectDay> createState() => _SelectDayState();
}

class _SelectDayState extends State<SelectDay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late int currentDay = 1;
  late ScrollController _scrollController; // 스크롤 컨트롤러 추가

  void changeDay(int i) {
    setState(() {
      currentDay = i;
    });
  }

  @override
  void initState() {
    currentDay = widget.today;
    super.initState();
    _controller = AnimationController(vsync: this);
    _scrollController = ScrollController(); // 스크롤 컨트롤러 초기화

    // TODAY 버튼 위치로 스크롤 조정
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // TODAY 버튼의 인덱스 계산
      int todayIndex = widget.today - 1; // 0-based index
      _scrollController.jumpTo(todayIndex * 84); // 스크롤 위치 조정 (버튼 간격에 따라 조정 필요)
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose(); // 스크롤 컨트롤러 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '${DateCalculator().getWeekDay(2024, 10, currentDay)} $currentDay',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController, // 스크롤 컨트롤러 설정,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 1; i <= widget.lastDayOfMonth; i++)
                        Row(
                          children: [
                            TextButton(
                              onPressed: () => changeDay(i),
                              child: Text(
                                i == widget.today ? 'TODAY' : i.toString(),
                                style: TextStyle(
                                  color: i == currentDay
                                      ? Colors.white
                                      : Colors.white.withOpacity(0.3),
                                  fontSize: 40,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                              child: Icon(
                                Icons.circle,
                                color: i == currentDay
                                    ? Colors.red.withOpacity(0.6)
                                    : Colors.transparent,
                                size: 12,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
