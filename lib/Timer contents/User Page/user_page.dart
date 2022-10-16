import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rubiks_timer/Timer%20contents/Root/cubit/root_cubit.dart';
import 'package:rubiks_timer/Timer%20contents/Root/root_navigation_bar.dart';

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
        backgroundColor: Colors.green,
        title: const Center(
          child: Text(
            'Rubixolve',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Jesteś zalogowany jako ${user.email}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<RootCubit>().signOut();
              },
              child: const Text('Wyloguj'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: RootBottomNavigationBar(
        currentIndex: 2,
        setIndex: context.read<RootCubit>().setIndex,
      ),
    );
  }
}
