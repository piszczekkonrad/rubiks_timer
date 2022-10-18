import 'package:flutter/material.dart';

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
