import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rubiks_timer/Solving/Solving%20Root/cubit/solving_root_cubit.dart';
import 'package:rubiks_timer/Solving/enums.dart';

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
        create: (context) => SolvingRootCubit()..start(),
        child: Column(
          children: [
            BlocBuilder<SolvingRootCubit, SolvingRootState>(
                builder: (context, state) {
              switch (state.status) {
                case Status.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );

                case Status.error:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case Status.whiteCross:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case Status.firstLayer:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case Status.secondLayer:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case Status.yellowCross:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case Status.oll:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case Status.pll:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case Status.complete:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
              }
            }),
          ],
        ),
      ),
    );
  }
}
