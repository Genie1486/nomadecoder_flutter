import 'package:flutter/material.dart';
import 'package:webtoon/models/webtoon_model.dart';
import 'package:webtoon/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // StatefulWidget의 State를 쓰지 않고
  // 1. Future 안의 데이터를 가져오고 싶다.
  // 2. Future의 로딩상태를 build 메서드에게 알리고 싶다.
  // 이 것을 해주는 Widget이 FutureBuilder Widget이다.
  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    print(webtoons);
    // Scaffold는 screen을 위한 기본적인 레이아웃과 설정을 제공
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2, // 밑에 그림자
        backgroundColor: Colors.white, // AppBar의 배경색
        foregroundColor: Colors.green, // AppBar의 글자색 설정
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      // FutureBuilder는 future 값을 기다리고 데이터가 존재하는지 알려준다
      // FutureBuilder(future, builder)에서
      // FutureBuilder가 await future로 future의 값을 기다려 준다.
      // builder는 UI를 그려주는 함수
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          // 여기 코드는
          // future의 동작이 끝나고 서버가 응답했을 때
          // 동작한다.

          // snapshot을 이용하면 Future의 상태를 알 수 있다.
          if (snapshot.hasData) {
            // 많은 양의 데이터를 연속적으로 보여주고 싶을 때 ListView 사용
            // ListView는 여러 항목을 나열하는데 최적화된 Widget이다.
            // ListView.builder는 좀 더 최적화된 ListView

            // ListView.separated는 separatorBuilder라는 매개변수를 가지고 있다.
            // separatorBuilder는 Widget을 리턴해주는 함수로
            // 이 Widget은 리스트 아이템 사이에 렌더링 된다.
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                // 에러발생
                // FlutterError (Horizontal viewport was given unbounded height.
                // Viewports expand in the cross axis to fill their container and constrain their children to match their extent in the cross axis.
                // In this case, a horizontal viewport was given an unlimited amount of vertical space in which to expand.)

                // ListView는 높이가 없기 때문에
                // 레이아웃 시스템은 ListView가 얼마나 큰지를 알지 못한다.
                // 따라서 ListView에 제한된 높이를 줘서 문제를 해결하였다.
                Expanded(
                  child: makeList(snapshot),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal, // 스크롤 방향 설정
      // ListView는 padding이 없어서 위쪽에는 그림자 효과가 잘려서 나타남
      // 그래서 padding을 부여해줌
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemCount:
          snapshot.data!.length, // ListView의 item 개수 설정 (ListView를 최적화 해주는 기능)
      itemBuilder: (context, index) {
        // ListView.builder은 모든 아이템을 한 번에 만들지 않고
        // 만들려는 아이템에 itemBuilder 함수를 실행한다.
        // item Builder는 ListView가 아이템을 build할 때 호출하는 함수
        print(index);

        var webtoon = snapshot.data![index];
        print(webtoon.thumb);
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
                webtoon.thumb,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              webtoon.title,
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
          ],
        );
      },
      // separatorBuilder는 아이템들 사이에 구분자를 넣어주는 builder
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
