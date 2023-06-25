import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rubiks_timer/Timer%20contents/Root/cubit/timer_root_cubit.dart';
import 'package:rubiks_timer/Timer%20contents/Root/timer_root_navigation_bar.dart';
import 'package:rubiks_timer/enums.dart';
import 'package:rubiks_timer/injection_container.dart';
import 'cubit/timer_cubit.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key, required this.user}) : super(key: key);
  final User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        title: const Center(
          child: Text(
            'Timer',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: BlocProvider<TimerCubit>(
        create: (context) => getIt()..start(),
        child: BlocConsumer<TimerCubit, TimerState>(
          listener: (context, state) {
            if (state.timerStatus == TimerStatus.saved) {
              user == null
                  ? ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("You are not logged in"),
                      ),
                    )
                  : context.read<TimerRootCubit>().setIndex(1);
            }
          },
          builder: (context, state) {
            return InkWell(
              onTap: () {
                switch (state.timerStatus) {
                  case TimerStatus.stopped:
                    context.read<TimerCubit>().timeStart();
                    break;
                  case TimerStatus.running:
                    context.read<TimerCubit>().timeStop();
                    break;
                  case TimerStatus.reseting:
                    context.read<TimerCubit>().timeReset();
                    break;
                  case TimerStatus.saved:
                    context.read<TimerCubit>().timeReset();
                    break;
                }
              },
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Tap the screen to start',
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        state.time,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      if (state.timerStatus == TimerStatus.reseting) ...[
                        ElevatedButton(
                          onPressed: () {
                            context.read<TimerCubit>().addTime();
                          },
                          child: const Text(
                            'Zapisz czas!',
                          ),
                        ),
                      ],
                    ]),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: RootBottomNavigationBar(
        currentIndex: 0,
        setIndex: context.read<TimerRootCubit>().setIndex,
      ),
    );
  }
}
