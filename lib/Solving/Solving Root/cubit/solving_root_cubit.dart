import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rubiks_timer/Solving/enums.dart';
import 'package:rubiks_timer/Solving/solving_repository.dart';

part 'solving_root_state.dart';

class SolvingRootCubit extends Cubit<SolvingRootState> {
  SolvingRootCubit(this._solvingRepository) : super(const SolvingRootState());
  final SolvingRepository _solvingRepository;
  Future<void> start() async {
    emit(const SolvingRootState(
      status: Status.whiteCross,
    ));
  }

  Future<void> load() async {
    emit(const SolvingRootState(
      status: Status.loading,
    ));
    try {
      final solvingModel = await _solvingRepository.getSolvingModel();

      emit(
        SolvingRootState(
          test: solvingModel!.alghorithm,
          status: Status.yellowCross,
        ),
      );
    } catch (error) {
      emit(
        SolvingRootState(
          test: error.toString(),
          status: Status.error,
        ),
      );
    }
  }
}
