import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rubiks_timer/Solving/enums.dart';

part 'solving_root_state.dart';

class SolvingRootCubit extends Cubit<SolvingRootState> {
  SolvingRootCubit() : super(const SolvingRootState());
  Future<void> start() async {
    emit(const SolvingRootState(
      status: Status.loading,
    ));
  }
}
