import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating; // 평점
  final double size; // 별 크기
  final double spacing; // 별 사이 간격

  const StarRating({
    super.key,
    required this.rating,
    this.size = 24.0, // 기본 크기 설정
    this.spacing = 4.0, // 기본 간격 설정
  });

  @override
  Widget build(BuildContext context) {
    // 10점 만점 -> 5개의 별로 변환
    double convertedRating = rating / 2;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        Widget star;

        if (convertedRating >= index + 1) {
          star = Icon(Icons.star, size: size, color: Colors.yellow); // 완전한 별
        } else if (convertedRating >= index + 0.5) {
          star = Icon(Icons.star_half, size: size, color: Colors.yellow); // 반 별
        } else {
          star =
              Icon(Icons.star_outline, size: size, color: Colors.yellow); // 빈 별
        }

        // 별 사이 간격 추가
        return Padding(
          padding: EdgeInsets.only(right: spacing),
          child: star,
        );
      }),
    );
  }

  Widget _buildStar(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // 그림자 색상
            offset: const Offset(2, 2), // 그림자 위치
            blurRadius: 4, // 흐림 정도
            spreadRadius: 1, // 확산 정도
          ),
        ],
      ),
      child: Icon(icon, size: size, color: Colors.white), // 별 아이콘
    );
  }
}
