# Stateful Widget

```
Stateless Widget
- 어떤 데이터도 가지고 있지 않고
- build 메서드를 통해서 단지 UI만을 출력한다.
```

```
Stateful Widget
- 상태를 가지고 있다.
- 상태에 따라 변하는 데이터가 있고
이 데이터가 변경될 때
그 변화를 UI에 반영하여
실시간으로 보고 싶은 경우 사용
- 위젯에 데이터를 저장하고 싶고
실시간으로 데이터의 변화를 보고 싶은 경우 사용

- Stateful Widget은 두 개의 부분으로 나뉨
1. 상태가 없는 위젯 그 자체
2. state : 위젯에 들어갈 데이터와 UI를 넣는 곳
           데이터가 변경되면 해당 위젯이 UI도 변경
```