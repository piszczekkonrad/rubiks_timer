import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rubiks_timer/Timer%20contents/Root/cubit/timer_root_cubit.dart';
import 'package:rubiks_timer/Timer%20contents/Root/timer_root_navigation_bar.dart';
import 'package:rubiks_timer/Timer%20contents/Times%20Page/times_remote_data_source.dart';
import 'cubit/times_page_cubit.dart';
import 'times_repository.dart';

class TimesPage extends StatelessWidget {
  const TimesPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        title: const Center(
          child: Text(
            'My Times',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: const TimesPageContent(),
      bottomNavigationBar: RootBottomNavigationBar(
        currentIndex: 1,
        setIndex: context.read<TimerRootCubit>().setIndex,
      ),
    );
  }
}

class TimesPageContent extends StatelessWidget {
  const TimesPageContent({
    Key? key,
  }) : super(key: key);

  String formatTime(int milliseconds) {
    var secs = milliseconds ~/ 1000;
    var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (secs % 60).toString().padLeft(2, '0');
    var miliseconds = ((milliseconds ~/ 10) % 100).toString().padLeft(2, '0');
    return "$minutes:$seconds:$miliseconds";
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimesPageCubit(
        timesRepository: TimesRepository(
          timesDataSource: TimesDataSource(),
        ),
      )..start(),
      child: BlocBuilder<TimesPageCubit, TimesPageState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return Center(
                child: Text('Something went wrong: ${state.errorMessage}'));
          }
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          final timeModels = state.times;
          return ListView(
            children: [
              for (final timeModel in timeModels) ...[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Dismissible(
                    key: ValueKey(timeModel.id),
                    onDismissed: (_) {
                      context.read<TimesPageCubit>().delete(timeModel.id);
                    },
                    child: Container(
                      color: Colors.green,
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.all(10),
                      child: Text(formatTime(timeModel.time)),
                    ),
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
