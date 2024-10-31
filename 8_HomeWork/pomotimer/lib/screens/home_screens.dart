import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          titleTextStyle: Theme.of(context).textTheme.displaySmall,
          title: const Text('POMOTIMER'),
        ),
        body: Column(
          children: [
            Flexible(
              flex: 3,
              child: Container(),
            ),
            Flexible(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '0/4',
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .fontSize,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .color!
                                  .withOpacity(0.5),
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .fontWeight,
                              height: 2,
                            ),
                          ),
                          Text(
                            'ROUND',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '0/12',
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .fontSize,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .color!
                                  .withOpacity(0.5),
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .fontWeight,
                              height: 2,
                            ),
                          ),
                          Text(
                            'GOAL',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
