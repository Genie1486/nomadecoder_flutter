import 'package:flutter/material.dart';

class TimeSelectionCard extends StatelessWidget {
  final int minute;
  final bool isSelected;

  const TimeSelectionCard({
    super.key,
    required this.minute,
    required this.isSelected,
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
            color: isSelected
                ? Theme.of(context).cardColor.withOpacity(0.75)
                : Colors.transparent,
            border: Border.all(
              color: Theme.of(context).cardColor.withOpacity(0.2), // 테두리 색상
              width: 2, // 테두리 두께
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            '$minute',
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.displayMedium!.fontSize,
              color: isSelected
                  ? Theme.of(context).colorScheme.surface
                  : Theme.of(context).textTheme.displayMedium!.color,
              fontWeight: Theme.of(context).textTheme.displayMedium!.fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
