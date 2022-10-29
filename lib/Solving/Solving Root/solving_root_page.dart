import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rubiks_timer/Solving/Solving%20Root/cubit/solving_root_cubit.dart';
import 'package:rubiks_timer/Solving/Solving%20Root/solving_page_contents.dart';
import 'package:rubiks_timer/Solving/enums.dart';
import 'package:rubiks_timer/Solving/solving_remote_data_source.dart';
import 'package:rubiks_timer/Solving/solving_repository.dart';

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
        create: (context) => SolvingRootCubit(
          SolvingRepository(
            SolvingRemoteDioDataSource(),
          ),
        )..start(),
        child: Center(
          child: BlocBuilder<SolvingRootCubit, SolvingRootState>(
            builder: (context, state) {
              switch (state.status) {
                case Status.loading:
                  return const CircularProgressIndicator();
                case Status.firstLayer:
                  return SolvingPageContents(
                    solvingModels: state.results,
                  );
                case Status.secondLayer:
                  return SolvingPageContents(
                    solvingModels: state.results,
                  );
                case Status.yellowCross:
                  return SolvingPageContents(
                    solvingModels: state.results,
                  );
                case Status.oll:
                  return SolvingPageContents(
                    solvingModels: state.results,
                  );
                case Status.pll:
                  return SolvingPageContents(
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
