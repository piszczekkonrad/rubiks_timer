import 'package:flutter/material.dart';

class SolvingPageContents extends StatelessWidget {
  const SolvingPageContents({
    Key? key,
    required this.forward,
    required this.test,
  }) : super(key: key);
  final Function forward;
  final String test;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(test),
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
