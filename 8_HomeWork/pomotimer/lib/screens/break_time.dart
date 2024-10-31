import 'package:flutter/material.dart';

class BreakTime extends StatelessWidget {
  const BreakTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 1,
          child: Center(
            child: Text(
              'Break Time !!',
              style: TextStyle(
                fontSize: 60,
                color: Theme.of(context).cardColor,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Icon(
              Icons.snooze,
              size: 100,
              color: Theme.of(context).cardColor,
            ),
          ),
        )
      ],
    );
  }
}
