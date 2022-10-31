import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rubiks_timer/Solving/Solving%20Root/cubit/solving_root_cubit.dart';
import 'package:rubiks_timer/Solving/Solving%20Root/solving_page_contents.dart';
import 'package:rubiks_timer/Solving/enums.dart';
import 'package:rubiks_timer/injection_container.dart';

class SolvingRootPage extends StatelessWidget {
  const SolvingRootPage({
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
            'Let\'s Solve!',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: BlocProvider<SolvingRootCubit>(
        create: (context) => getIt()..firstLayer(),
        child: Center(
          child: BlocBuilder<SolvingRootCubit, SolvingRootState>(
            builder: (context, state) {
              switch (state.status) {
                case Status.loading:
                  return const CircularProgressIndicator();
                case Status.firstLayer:
                  return SolvingPageContents(
                    solvingModels: state.results,
                    backwards: Navigator.of(context).pop,
                    forward: context.read<SolvingRootCubit>().secondLayer,
                  );
                case Status.secondLayer:
                  return SolvingPageContents(
                    backwards: context.read<SolvingRootCubit>().firstLayer,
                    forward: context.read<SolvingRootCubit>().yellowCross,
                    solvingModels: state.results,
                  );
                case Status.yellowCross:
                  return SolvingPageContents(
                    backwards: context.read<SolvingRootCubit>().secondLayer,
                    forward: context.read<SolvingRootCubit>().permuteLastLayer,
                    solvingModels: state.results,
                  );
                case Status.pll:
                  return SolvingPageContents(
                    backwards: context.read<SolvingRootCubit>().yellowCross,
                    forward: context.read<SolvingRootCubit>().orientLastLayer,
                    solvingModels: state.results,
                  );
                case Status.oll:
                  return SolvingPageContents(
                    backwards:
                        context.read<SolvingRootCubit>().permuteLastLayer,
                    forward: Navigator.of(context).pop,
                    solvingModels: state.results,
                  );
                case Status.error:
                  return Text(state.errorMessage!);
              }
            },
          ),
        ),
      ),
    );
  }
}
