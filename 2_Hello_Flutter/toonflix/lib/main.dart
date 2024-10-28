import 'package:flutter/material.dart';
import 'package:toonflix/widgets/Button.dart';
import 'package:toonflix/widgets/currency_card.dart';

// constant는
// 수정할 수 없고,
// compile 전에 그 value를 알 수 있는 변수
// 런타임 중이 아니라 컴파일 하는 중에 값을 산정할 수 있기에
// constant는 최적화에 도움을 준다.

// 저장할 때마다 자동으로 const를 붙여주고 싶다면
// Step1 ~ Step3 과정을 따라 주세요

// Step1 명령팔레트 열기
// - 방법 1. 설정 -> 명령팔레트
// - 방법 2. ctrl + shift + p

// Step2 open user setting 입력

// Step3 setting.json에 다음 코드 입력하기
// "editor.codeActionsOnSave": {
//     "source.fixAll": true
// },

// 가이드 라인을 보고 싶다면
// setting.json에 아래 코드 입력
// "dart.previewFlutterUiGuides": true,

void main() {
  // App Widget은 우리 앱의 root(시적점) 이다.
  // 모든 화면과 버튼 등등의 모든 것들이 App Widget으로 부터 올 것이다.
  runApp(const App());
}

// StatelessWidget은 기초적인 Widget으로
// 화면에 뭔가를 띄어주는 역할만 한다.
class App extends StatelessWidget {
  const App({super.key});

  // 모든 Widget은 build 메서드를 구현해줘야 한다.
  // flutter는 build 메서드가 리턴하는 것을 화면에서 보여준다.
  // 즉, build 메서드는 Widget의 UI를 만든다.

  @override
  Widget build(BuildContext context) {
    // build는 Widget을 return 해줘야 한다.
    // 우리 앱이어떻게 보이게 하고 싶은지에 따라 다음 두가지 옵션이 있다.
    // Option1 : Material 앱을 return (구글의 디자인 시스템)
    // Option2 : cupertino 앱을 return (애플의 디자인 시스템)
    return MaterialApp(
      // 화면을 만들 때 Scaffold가 필요하다.
      // Scaffold는 화면의 구조를 제공해준다.
      // home은 앱의 홈페이지를 의미하는듯
      home: Scaffold(
          // body는 웹페이지의 바디 같은 역할
          // Center는 child를 가운데로 오게하는 Widget이다.
          backgroundColor: const Color(0xFF181818),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizeBox로 제일 위에 높이 80의 빈 열 생성
                const SizedBox(
                  height: 30,
                ),
                Row(
                  // 오른쪽 정렬
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Hey, Selena',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          'Welcome back',
                          style: TextStyle(
                            // 아래 두 코드는 같은 결과
                            // color : Colors.fromRGBO(255,255,255,0.8);
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Total balance',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  '\$5 194 482',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Container는 일종의 div
                    // Container를
                    // background color, border radius 등의 옵션들로
                    // 꾸며줄 수 있다.
                    Button(
                      text: 'Transfer',
                      bgColor: Color(0xFFF1B33B),
                      textColor: Colors.black,
                    ),
                    Button(
                      text: 'Request',
                      bgColor: Color(0xFF1F2123),
                      textColor: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Wallets',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const CurrencyCard(
                  name: 'Euro',
                  code: 'EUR',
                  amount: '6 428',
                  icon: Icons.euro_rounded,
                ),
                const CurrencyCard(
                  name: 'Bitcoin',
                  code: 'BTC',
                  amount: '9 785',
                  icon: Icons.currency_bitcoin,
                ),
              ],
            ),
          )),
    );
  }
}
