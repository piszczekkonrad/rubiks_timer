import 'package:flutter/material.dart';

class RootBottomNavigationBar extends StatelessWidget {
  const RootBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.setIndex,
  }) : super(key: key);

  final int currentIndex;
  final Function setIndex;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (newIndex) {
        setIndex(newIndex);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.access_alarm),
          label: 'Timer',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.emoji_events_rounded),
          label: 'Moje wyniki',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Moje konto',
        ),
      ],
      backgroundColor: Colors.green,
      selectedItemColor: Colors.black,
    );
  }
}
