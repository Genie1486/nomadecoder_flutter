import 'package:flutter/material.dart';

void main() {
  // App Widget은 우리 앱의 root(시적점) 이다.
  // 모든 화면과 버튼 등등의 모든 것들이 App Widget으로 부터 올 것이다.
  runApp(App());
}

// StatelessWidget은 기초적인 Widget으로
// 화면에 뭔가를 띄어주는 역할만 한다.
class App extends StatelessWidget {
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
          backgroundColor: Colors.black,
          body: Column(
            children: [
              // SizeBox로 제일 위에 높이 80의 빈 열 생성
              SizedBox(
                height: 80,
              ),
              Row(
                // 오른쪽 정렬
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
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
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
