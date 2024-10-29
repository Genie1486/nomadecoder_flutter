import 'package:flutter/material.dart';

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
                  height: 40,
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
                  height: 20,
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
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 254, 248, 84),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  height: 150,
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text('11'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('30'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('|'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('12'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('20'),
                                ],
                              )
                            ],
                          ),
                          Column(children: [
                            Text(
                              'DESIGN',
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w600,
                                height: 1,
                              ),
                            ),
                            Text(
                              'METTING',
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w600,
                                height: 1,
                              ),
                            ),
                          ]),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'ALEX HELENA NANA',
                            style: TextStyle(
                              color: darkenColor(const Color(0xFFFFE754), 0.3),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 254, 248, 84),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  height: 150,
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text('11'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('30'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('|'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('12'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('20'),
                                ],
                              )
                            ],
                          ),
                          Column(children: [
                            Text(
                              'DESIGN',
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w600,
                                height: 1,
                              ),
                            ),
                            Text(
                              'METTING',
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w600,
                                height: 1,
                              ),
                            ),
                          ]),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'ALEX HELENA NANA',
                            style: TextStyle(
                              color: darkenColor(const Color(0xFFFFE754), 0.3),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 254, 248, 84),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  height: 150,
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text('11'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('30'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('|'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('12'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('20'),
                                ],
                              )
                            ],
                          ),
                          Column(children: [
                            Text(
                              'DESIGN',
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w600,
                                height: 1,
                              ),
                            ),
                            Text(
                              'METTING',
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w600,
                                height: 1,
                              ),
                            ),
                          ]),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'ALEX HELENA NANA',
                            style: TextStyle(
                              color: darkenColor(const Color(0xFFFFE754), 0.3),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

Color darkenColor(Color color, double amount) {
  int r = (color.red * (1 - amount)).round();
  int g = (color.green * (1 - amount)).round();
  int b = (color.blue * (1 - amount)).round();
  return Color.fromARGB(color.alpha, r, g, b);
}
