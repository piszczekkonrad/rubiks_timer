import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rubiks_timer/Solving/enums.dart';
import 'package:rubiks_timer/Solving/solving_model.dart';
import 'package:rubiks_timer/Solving/solving_repository.dart';

part 'solving_root_state.dart';
part 'solving_root_cubit.freezed.dart';

@injectable
class SolvingRootCubit extends Cubit<SolvingRootState> {
  SolvingRootCubit({required this.solvingRepository})
      : super(SolvingRootState());
  final SolvingRepository solvingRepository;

  Future<void> firstLayer() async {
    emit(
      SolvingRootState(
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

  Future<void> secondLayer() async {
    emit(
      SolvingRootState(
        status: Status.loading,
      ),
    );
    try {
      final results = await solvingRepository.getSLModel();

      emit(
        SolvingRootState(
          results: results,
          status: Status.secondLayer,
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

  Future<void> yellowCross() async {
    emit(
      SolvingRootState(
        status: Status.loading,
      ),
    );
    try {
      final results = await solvingRepository.getYCModel();

      emit(
        SolvingRootState(
          results: results,
          status: Status.yellowCross,
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

  Future<void> permuteLastLayer() async {
    emit(
      SolvingRootState(
        status: Status.loading,
      ),
    );
    try {
      final results = await solvingRepository.getPLLModel();

      emit(
        SolvingRootState(
          results: results,
          status: Status.pll,
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

  Future<void> orientLastLayer() async {
    emit(
      SolvingRootState(
        status: Status.loading,
      ),
    );
    try {
      final results = await solvingRepository.getOLLModel();

      emit(
        SolvingRootState(
          results: results,
          status: Status.oll,
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
