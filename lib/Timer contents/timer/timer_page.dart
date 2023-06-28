import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
                      SnackBar(
                          content: Text(
                            "You are not logged in",
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            ),
                          ),
                          action: SnackBarAction(
                            label: 'Log in',
                            onPressed: () {
                              context.read<TimerRootCubit>().setIndex(2);
                            },
                          )),
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
              child: _TimerPageContents(
                time: state.time,
                timerStatus: state.timerStatus,
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

class _TimerPageContents extends StatelessWidget {
  const _TimerPageContents({
    Key? key,
    required this.time,
    required this.timerStatus,
  }) : super(key: key);

  final String time;
  final TimerStatus timerStatus;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Tap the screen to start, stop or reset',
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Text(
          time,
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        if (timerStatus == TimerStatus.reseting ||
            timerStatus == TimerStatus.saved) ...[
          const TimerSaveButton(),
        ],
      ]),
    );
  }
}

class TimerSaveButton extends StatelessWidget {
  const TimerSaveButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
        fixedSize: const Size(240, 60),
      ),
      onPressed: () {
        context.read<TimerCubit>().addTime();
      },
      child: Text(
        'Save',
        style: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      ),
    );
  }
}
