import 'package:flutter/material.dart';

class Rectangle extends StatelessWidget {
  final double width, height;
  final String content;

  const Rectangle({
    super.key,
    required this.width,
    required this.height,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          width: width,
          height: height,
        ),
        Container(
          width: width * 0.8,
          height: height * 0.96,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(5), // 여기서 사용
          ),
        ),
        Container(
          width: width * 0.9,
          height: height * 0.93,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        Container(
          width: width,
          height: height * 0.9,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              content,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.surface,
                  fontSize: 70,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}
