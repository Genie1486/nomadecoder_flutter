import 'package:flutter/material.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image.network(src)는
        // 네트워크 주소에 있는 이미지를 가져온다.
        Container(
          width: 250,
          // clipBehavior는 자식의 부모 영역 침범을 제어하는 방법
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 15, // 그림자가 얼마나 멀리까지 드리울지
                offset: const Offset(10, 10), // 그림자가 어디에 위치할지
                color: Colors.black.withOpacity(0.5),
              )
            ],
          ),
          child: Image.network(
            thumb,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
      ],
    );
  }
}
