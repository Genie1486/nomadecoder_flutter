import 'package:flutter/material.dart';

class TimeSelectionCard extends StatelessWidget {
  final int minute;

  const TimeSelectionCard({
    super.key,
    required this.minute,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Container(
          alignment: Alignment.center,
          width: 85,
          height: 60,
          decoration: BoxDecoration(
            // color: Theme.of(context).cardColor,
            border: Border.all(
              color: Theme.of(context).cardColor, // 테두리 색상
              width: 3, // 테두리 두께
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            '$minute',
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.displayMedium!.fontSize,
              color: Theme.of(context).textTheme.displayMedium!.color,
              fontWeight: Theme.of(context).textTheme.displayMedium!.fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
