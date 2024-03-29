import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rubiks_timer/Timer%20contents/Root/cubit/timer_root_cubit.dart';
import 'package:rubiks_timer/Timer%20contents/Root/timer_root_navigation_bar.dart';
import 'package:rubiks_timer/Timer%20contents/Times%20Page/times_model.dart';
import 'package:rubiks_timer/injection_container.dart';

import 'cubit/times_page_cubit.dart';

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

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TimesPageCubit>(
      create: (context) => getIt()..start(),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Swipe left to delete',
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                  ),
                ],
              ),
              for (final timeModel in timeModels) ...[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: _ListViewItem(
                      timeModel: timeModel, timeModels: timeModels),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}

class _ListViewItem extends StatelessWidget {
  const _ListViewItem({
    Key? key,
    required this.timeModel,
    required this.timeModels,
  }) : super(key: key);

  final TimesModel timeModel;
  final List<TimesModel> timeModels;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: const _ListViewItemBackgroud(),
      confirmDismiss: (direction) async {
        return direction == DismissDirection.endToStart;
      },
      key: ValueKey(timeModel.id),
      onDismissed: (_) {
        context.read<TimesPageCubit>().delete(timeModel.id);
      },
      child: Container(
        color: Colors.green,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _ListViewItemIndex(timeModels: timeModels, timeModel: timeModel),
            _ListViewItemText(timeModel: timeModel),
          ],
        ),
      ),
    );
  }
}

class _ListViewItemText extends StatelessWidget {
  const _ListViewItemText({
    Key? key,
    required this.timeModel,
  }) : super(key: key);

  final TimesModel timeModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            timeModel.time,
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1),
            ),
          ),
        ],
      ),
    );
  }
}

class _ListViewItemIndex extends StatelessWidget {
  const _ListViewItemIndex({
    Key? key,
    required this.timeModels,
    required this.timeModel,
  }) : super(key: key);

  final List<TimesModel> timeModels;
  final TimesModel timeModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.all(2),
      child: Text(
        (timeModels.indexOf(timeModel) + 1).toString(),
        style: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      ),
    );
  }
}

class _ListViewItemBackgroud extends StatelessWidget {
  const _ListViewItemBackgroud({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.red,
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(right: 32.0),
          child: Icon(
            Icons.delete,
          ),
        ),
      ),
    );
  }
}
