import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;

  const CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
  });

  @override
  Widget build(Object context) {
    return Container(
      // clipBehavior는
      // Container의 어떤 아이템이
      // overflow가 되었을 때
      // 어떻게 처리할 것인지 설정하는 속성
      // Clip.hardEdge -> overflow 된 부분 사라지게함
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: const Color(0xFF1F2123),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      amount,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      code,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Transform.scale
            // 부모에 영향을 끼치지 않고
            // 자식 요소의 크기를 바꿀 수 있다.
            Transform.scale(
              scale: 2.2,
              child: Transform.translate(
                // Transform.translate로 child를
                // 오른쪽으로 8, 왼쪽으로 15만큼 이동
                offset: const Offset(-5, 12),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 88,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
