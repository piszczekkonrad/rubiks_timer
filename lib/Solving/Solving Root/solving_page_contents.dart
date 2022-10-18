import 'package:flutter/material.dart';
import 'package:rubiks_timer/Solving/Solving%20Root/cubit/solving_root_cubit.dart';

class SolvingPageContents extends StatelessWidget {
  const SolvingPageContents({
    Key? key,
    required this.forward,
  }) : super(key: key);
  final Function forward;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("White Cross"),
        ElevatedButton(
          onPressed: () {
            forward();
          },
          child: const Text("Load test"),
        ),
      ],
    );
  }
}
