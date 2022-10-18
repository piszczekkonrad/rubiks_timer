import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rubiks_timer/Solving/Solving%20Root/cubit/solving_root_cubit.dart';
import 'package:rubiks_timer/Solving/Solving%20Root/solving_page_contents.dart';
import 'package:rubiks_timer/Solving/enums.dart';
import 'package:rubiks_timer/Solving/solving_repository.dart';

class SolvingRootPage extends StatelessWidget {
  const SolvingRootPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(
          child: Text(
            'Układamy!',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: BlocProvider<SolvingRootCubit>(
        create: (context) => SolvingRootCubit(SolvingRepository())..start(),
        child: Center(child: BlocBuilder<SolvingRootCubit, SolvingRootState>(
            builder: (context, state) {
          switch (state.status) {
            case Status.loading:
              return const CircularProgressIndicator();
            case Status.whiteCross:
              return SolvingPageContents(
                forward: context.read<SolvingRootCubit>().load,
                test: "White Cross",
              );

            case Status.firstLayer:
              return const CircularProgressIndicator();
            case Status.secondLayer:
              return const CircularProgressIndicator();
            case Status.yellowCross:
              return SolvingPageContents(
                forward: context.read<SolvingRootCubit>().load,
                test: state.test,
              );
            case Status.oll:
              return const CircularProgressIndicator();
            case Status.pll:
              return const CircularProgressIndicator();
            case Status.complete:
              return const CircularProgressIndicator();
            case Status.error:
              return SolvingPageContents(
                forward: context.read<SolvingRootCubit>().load,
                test: "error",
              );
          }
        })),
      ),
    );
  }
}
