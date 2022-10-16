import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageButtons extends StatelessWidget {
  const HomePageButtons(
    this.title,
    this.strona, {
    Key? key,
  }) : super(key: key);

  final String title;
  final Widget strona;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
        fixedSize: const Size(240, 60),
      ),
      child: Text(
        title,
        style: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => strona,
          ),
        );
      },
    );
  }
}
