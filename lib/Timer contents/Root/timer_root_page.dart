import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rubiks_timer/Timer%20contents/Login%20Page/login_page.dart';
import 'package:rubiks_timer/Timer%20contents/Root/cubit/timer_root_cubit.dart';
import 'package:rubiks_timer/Timer%20contents/Times%20Page/times_page.dart';
import 'package:rubiks_timer/Timer%20contents/User%20Page/user_page.dart';
import 'package:rubiks_timer/Timer%20contents/timer/timer_page.dart';
import 'package:rubiks_timer/injection_container.dart';

class TimerRootPage extends StatelessWidget {
  const TimerRootPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TimerRootCubit>(
      create: (context) => getIt()..start(),
      child: BlocConsumer<TimerRootCubit, TimerRootState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.index == 0) {
            return TimerPage(
              user: state.user,
            );
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
            return UserPage(
              user: state.user!,
            );
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
