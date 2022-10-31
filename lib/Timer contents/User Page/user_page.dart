import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rubiks_timer/Timer%20contents/Root/cubit/timer_root_cubit.dart';
import 'package:rubiks_timer/Timer%20contents/Root/timer_root_navigation_bar.dart';

class UserPage extends StatelessWidget {
  const UserPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        title: const Center(
          child: Text(
            'My Account',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You are logged in as ${user.email}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<TimerRootCubit>().signOut();
              },
              child: const Text('Log Out'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: RootBottomNavigationBar(
        currentIndex: 2,
        setIndex: context.read<TimerRootCubit>().setIndex,
      ),
    );
  }
}
