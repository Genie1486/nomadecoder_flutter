import 'package:flutter/material.dart';
import 'package:todo/widgets/metting_card.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/profile_picture.png', // 커스텀 이미지 경로
                      width: 80.0, // 너비
                      height: 80.0, // 높이
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'MONDAY 16',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                  'TODAY 17 18 19 20 21 22 23 24 25 26 27 28 29 30',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const MettingCard(
                  bgColor: Color.fromARGB(255, 254, 248, 84),
                  fromHour: '11',
                  fromMin: '30',
                  toHour: '12',
                  toMin: '20',
                  titleFirstRow: 'DESIGN',
                  titleSecondRow: 'METTING',
                  team: ['ALEX', 'HELENA', 'NANA'],
                ),
                const MettingCard(
                  bgColor: Color(0xFF9c6bce),
                  fromHour: '12',
                  fromMin: '35',
                  toHour: '14',
                  toMin: '10',
                  titleFirstRow: 'DAILY',
                  titleSecondRow: 'PROJECT',
                  team: ['ME', 'RICHARD', 'CIRY', '+4'],
                ),
                const MettingCard(
                  bgColor: Color(0xFFbcee4b),
                  fromHour: '15',
                  fromMin: '00',
                  toHour: '16',
                  toMin: '30',
                  titleFirstRow: 'WEEKLY',
                  titleSecondRow: 'PLANNING',
                  team: ['DEN', 'NANA', 'MARK'],
                ),
              ],
            )),
      ),
    );
  }
}
