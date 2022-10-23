import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rubiks_timer/Solving/enums.dart';
import 'package:rubiks_timer/Solving/solving_model.dart';
import 'package:rubiks_timer/Solving/solving_repository.dart';

part 'solving_root_state.dart';

class SolvingRootCubit extends Cubit<SolvingRootState> {
  SolvingRootCubit(this._solvingRepository) : super(const SolvingRootState());
  final SolvingRepository _solvingRepository;

  Future<void> start() async {
    emit(
      const SolvingRootState(
        status: Status.loading,
      ),
    );
    try {
      final results = await _solvingRepository.getSolvingModel();

      emit(
        SolvingRootState(
          results: results,
          status: Status.whiteCross,
        ),
      );
    } catch (error) {
      emit(
        SolvingRootState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
