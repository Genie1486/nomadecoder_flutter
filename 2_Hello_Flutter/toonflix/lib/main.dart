import 'package:flutter/material.dart';

void main() {
  // App Widget은 우리 앱의 root(시적점) 이다.
  // 모든 화면과 버튼 등등의 모든 것들이 App Widget으로 부터 올 것이다.
  runApp(App());
}

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
      home: Scaffold(
        // appBar는 웹페이지의 헤더 같은 역할
        appBar: AppBar(
          title: Text('Hello flutter!'),
        ),
        // body는 웹페이지의 바디 같은 역할
        // Center의 역할은 안에 있는 것들을 가운데에 배치시켜준다.
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
