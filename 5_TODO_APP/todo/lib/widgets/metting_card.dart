import 'package:flutter/material.dart';

Color darkenColor(Color color, double amount) {
  int r = (color.red * (1 - amount)).round();
  int g = (color.green * (1 - amount)).round();
  int b = (color.blue * (1 - amount)).round();
  return Color.fromARGB(color.alpha, r, g, b);
}

class MettingCard extends StatefulWidget {
  final Color bgColor;
  final String fromHour, fromMin, toHour, toMin;
  final String titleFirstRow, titleSecondRow;
  final List<String> team;

  const MettingCard({
    super.key,
    required this.bgColor,
    required this.fromHour,
    required this.fromMin,
    required this.toHour,
    required this.toMin,
    required this.titleFirstRow,
    required this.titleSecondRow,
    required this.team,
  });

  @override
  State<MettingCard> createState() => _MettingCardState();
}

class _MettingCardState extends State<MettingCard>
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
    return Container(
      margin: const EdgeInsets.only(top: 6),
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(40),
      ),
      height: 158,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(widget.fromHour,
                        style: const TextStyle(
                          fontSize: 25,
                          height: 1,
                        )),
                    Text(widget.fromMin),
                    const Text('|',
                        style: TextStyle(
                          fontSize: 20,
                          height: 0.8,
                        )),
                    Text(widget.toHour,
                        style: const TextStyle(
                          fontSize: 25,
                          height: 1,
                        )),
                    Text(widget.toMin),
                  ],
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Transform.translate(
                offset: const Offset(0, -12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.titleFirstRow,
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w600,
                          height: 0.9,
                        ),
                      ),
                      Text(
                        widget.titleSecondRow,
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w600,
                          height: 0.9,
                        ),
                      ),
                    ]),
              ),
            ],
          ),
          const SizedBox(
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 55),
            child: Row(
              children: [
                for (String person in widget.team)
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text(person,
                        style: TextStyle(
                            color: person == 'ME'
                                ? darkenColor(widget.bgColor, 0.8)
                                : darkenColor(widget.bgColor, 0.3))),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
