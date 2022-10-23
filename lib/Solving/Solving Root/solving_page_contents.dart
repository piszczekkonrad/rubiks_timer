import 'package:flutter/material.dart';
import 'package:rubiks_timer/Solving/solving_model.dart';

class SolvingPageContents extends StatelessWidget {
  const SolvingPageContents({
    Key? key,
    required this.solvingModels,
    this.backwards,
    this.forward,
  }) : super(key: key);
  final Function? backwards;
  final Function? forward;
  final List<SolvingModel> solvingModels;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ListView(
            children: [
              for (final solvingModel in solvingModels)
                _SolvingItemWidget(solvingModel: solvingModel),
            ],
          ),
        ),
        const SolvingBottomNavigationBar()
      ],
    );
  }
}

class SolvingBottomNavigationBar extends StatelessWidget {
  const SolvingBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}

class _SolvingItemWidget extends StatelessWidget {
  const _SolvingItemWidget({
    Key? key,
    required this.solvingModel,
  }) : super(key: key);

  final SolvingModel solvingModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
