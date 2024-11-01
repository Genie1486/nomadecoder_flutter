import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2, // 밑에 그림자
        backgroundColor: Colors.white, // AppBar의 배경색
        foregroundColor: Colors.green, // AppBar의 글자색 설정
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: id,
                child: Container(
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
