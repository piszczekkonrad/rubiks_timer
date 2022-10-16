import 'package:flutter/material.dart';
import 'package:rubiks_timer/Times%20Page/times_page.dart';
import 'timer_page.dart';

class TimerBottomNavigationBar extends StatelessWidget {
  const TimerBottomNavigationBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (newIndex) {
        if (newIndex == 0) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const TimerPage(),
            ),
          );
        }
        if (newIndex == 1) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const TimesPage(),
            ),
          );
        }
        if (newIndex == 2) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const TimerPage(),
            ),
          );
        }
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
    );
  }
}
