import 'package:flutter/material.dart';
import 'package:todo/widgets/date_calculator.dart';

class SelectDay extends StatefulWidget {
  final int currentDay = 16;
  final int lastDayOfMonth = 31;
  const SelectDay({super.key});

  @override
  State<SelectDay> createState() => _SelectDayState();
}

class _SelectDayState extends State<SelectDay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
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
                '${DateCalculator().getWeekDay(2024, 10, widget.currentDay)} ${widget.currentDay}',
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
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 1; i <= widget.lastDayOfMonth; i++)
                        Row(
                          children: [
                            Text(
                                i == widget.currentDay ? 'TODAY' : i.toString(),
                                style: TextStyle(
                                  color: i == widget.currentDay
                                      ? Colors.white
                                      : Colors.white.withOpacity(0.3),
                                  fontSize: 40,
                                  fontWeight: FontWeight.w400,
                                )),
                            SizedBox(
                              width: 20,
                              child: Icon(
                                Icons.circle,
                                color: i == widget.currentDay
                                    ? Colors.red.withOpacity(0.6)
                                    : Colors.transparent,
                                size: 12,
                              ),
                            )
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
