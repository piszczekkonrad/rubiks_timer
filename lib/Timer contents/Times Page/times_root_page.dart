import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../timer/timer_page.dart';
import 'times_page.dart';

class TimesRootPage extends StatelessWidget {
  const TimesRootPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          final user = snapshot.data;
          if (user == null) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Nie jesteś zalogowany'),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const TimerPage(),
                          ),
                        );
                      },
                      child: const Text('Przejdź do logowania'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const TimerPage(),
                          ),
                        );
                      },
                      child: const Text('Wróć do stopera'),
                    )
                  ],
                ),
              ),
            );
          }
          return const TimesPage();
        });
  }
}
