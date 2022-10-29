import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:rubiks_timer/Solving/enums.dart';
import 'package:rubiks_timer/Solving/solving_model.dart';
import 'package:rubiks_timer/Solving/solving_repository.dart';

part 'solving_root_state.dart';

@injectable
class SolvingRootCubit extends Cubit<SolvingRootState> {
  SolvingRootCubit({required this.solvingRepository})
      : super(const SolvingRootState());
  final SolvingRepository solvingRepository;

  Future<void> start() async {
    emit(
      const SolvingRootState(
        status: Status.loading,
      ),
    );
    try {
      final results = await solvingRepository.getFLModel();

      emit(
        SolvingRootState(
          results: results,
          status: Status.firstLayer,
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
