import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rubiks_timer/Timer%20contents/Root/cubit/timer_root_cubit.dart';
import 'package:rubiks_timer/Timer%20contents/Root/timer_root_navigation_bar.dart';
import 'package:rubiks_timer/injection_container.dart';
import 'cubit/timer_cubit.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);

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
            if (state.saved) {
              context.read<TimerRootCubit>().setIndex(1);
            }
          },
          builder: (context, state) {
            return InkWell(
              onTap: () {
                if (state.reseting) {
                  context.read<TimerCubit>().timeReset();
                } else if (state.running) {
                  context.read<TimerCubit>().timeStop();
                } else {
                  context.read<TimerCubit>().timeStart();
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
                      if (state.reseting) ...[
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
          currentIndex: 0, setIndex: context.read<TimerRootCubit>().setIndex),
    );
  }
}
