import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rubiks_timer/Home%20Page/home_page_button.dart';
import 'package:rubiks_timer/Solving/Solving%20Root/solving_root_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(
          child: Text(
            "Introduction",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Text(
                "Solving rubik's cube require you to know the alghorithms, and when to use them. \nIn the let's solve part, you will learn these alghorithm, but first you have to learn the notation.\nR - right side\nL - left side\nU- up side\nD-downside\nF- front side\nB - back side\nSingle letter means, you have to turn corresponding side clockwise, for example R means clockwise turn of right side.\nIf you see for example R', that would mean counterclockwise turn.\nSomething like R2 indicates double turn in any dirrection, because on simple 3x3x3 cube, the outcome is the same either way after double turn.\nIt might take you a few tries to catch a grasp on it, but it's better to learn it right of the bat. You'll make it under a minute in no time!",
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const HomePageButton(
                'Let\'s Solve!',
                SolvingRootPage(),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
