import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rubiks_timer/Solving/solving_model.dart';

class SolvingPageContents extends StatelessWidget {
  const SolvingPageContents({
    Key? key,
    required this.test,
    required this.solvingModel,
    this.backwards,
    this.forward,
  }) : super(key: key);
  final Function? backwards;
  final Function? forward;
  final SolvingModel solvingModel;
  final String test;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 30,
                ),
                child: Text(
                  "Solve white cross",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 30,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black12,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 160,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          image: DecorationImage(
                            image: NetworkImage(
                              solvingModel.picture,
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    solvingModel.alghorithm,
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.arrow_back,
                ),
                label: "Oops, go back..."),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.arrow_forward,
                ),
                label: "Got it, next!")
          ],
          backgroundColor: Colors.green,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
        )
      ],
    );
  }
}

class BottomNavigtionButtons extends StatelessWidget {
  const BottomNavigtionButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
            ),
            onPressed: () {},
            child: Text(
              "Ooops, go back...",
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
            ),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
            ),
            onPressed: () {},
            child: Text(
              "Got it, next!",
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
            ),
          ),
        )
      ],
    );
  }
}
