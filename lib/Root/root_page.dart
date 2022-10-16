import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rubiks_timer/Login%20Page/login_page.dart';
import 'package:rubiks_timer/Root/cubit/root_cubit.dart';
import 'package:rubiks_timer/Times%20Page/times_page.dart';
import 'package:rubiks_timer/User%20Page/user_page.dart';
import 'package:rubiks_timer/timer/timer_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootCubit()..start(),
      child: BlocConsumer<RootCubit, RootState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.index == 0) {
            return const TimerPage();
          }

          if (state.index == 1) {
            if (state.user == null) {
              return LoginPage();
            }
            return const TimesPage();
          }

          if (state.index == 2) {
            if (state.user == null) {
              return LoginPage();
            }
            return UserPage(user: state.user!);
          }
          return const Scaffold(
            body: Center(
              child: Text("something went wrong"),
            ),
          );
        },
      ),
    );
  }
}
