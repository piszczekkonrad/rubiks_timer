import 'package:flutter/material.dart';
import 'package:rubiks_timer/Solving/Solving%20Root/solving_root_page.dart';
import 'package:rubiks_timer/Timer%20contents/Root/timer_root_page.dart';
import 'home_page_buttons.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(
          child: Text(
            'Rubixolve',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            HomePageButtons(
              'Wprowadzenie',
              TimerRootPage(),
            ),
            SizedBox(height: 15),
            HomePageButtons(
              'Układamy!',
              SolvingRootPage(),
            ),
            SizedBox(height: 15),
            HomePageButtons(
              'Timer',
              TimerRootPage(),
            ),
            SizedBox(height: 15),
            HomePageButtons(
              'Algorytmy',
              TimerRootPage(),
            ),
          ],
        ),
      ),
    );
  }
}
