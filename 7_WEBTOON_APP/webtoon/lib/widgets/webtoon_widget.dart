import 'package:flutter/material.dart';
import 'package:webtoon/screens/detail_screen.dart';

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
    // GestureDetector는 대부분의 동작을 감지하도록 해준다.
    return GestureDetector(
      // onTap은 유저가 클릭했을 때 실행될 함수를 지정
      onTap: () {
        // screen을 변경하기 위해서 Navigator 사용
        // Navigator는 우리가 만든 DetailScreen Widget을
        // 지금 보는 화면의 위에 올려준다.

        // Navigator.push(context, route) 에서
        // route는
        // DetailScreen 같은 StatelessWidget을
        // 애니메이션 효과로 감싸서
        // 스크린처럼 보이도록 하겠다는 것
        Navigator.push(
          context,
          // MaterialPageRoute는 화면 이동 관련 애니메이션을 생성해준다.
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              title: title,
              thumb: thumb,
              id: id,
            ),
            fullscreenDialog: true, // 팝업 창 느낌..^^ 'x' 버튼을 누르면 원래창으로
          ),
        );
      },
      child: Column(
        children: [
          // Hero Widget은 화면을 전환할 때 멋진 애니메이션을 제공해준다.
          // Hero는 두 화면 사이에 애니메이션을 주는 컴포넌트
          // 파워포인트의 모핑효과 비슷
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
              // Image.network(src)는
              // 네트워크 주소에 있는 이미지를 가져온다.
              child: Image.network(
                thumb,
              ),
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
      ),
    );
  }
}
