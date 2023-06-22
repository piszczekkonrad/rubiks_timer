import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rubiks_timer/enums.dart';
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
        status: SolvingStatus.loading,
      ),
    );
    try {
      final results = await solvingRepository.getFLModel();

      emit(
        SolvingRootState(
          results: results,
          status: SolvingStatus.firstLayer,
        ),
      );
    } catch (error) {
      emit(
        SolvingRootState(
          status: SolvingStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> secondLayer() async {
    emit(
      SolvingRootState(
        status: SolvingStatus.loading,
      ),
    );
    try {
      final results = await solvingRepository.getSLModel();

      emit(
        SolvingRootState(
          results: results,
          status: SolvingStatus.secondLayer,
        ),
      );
    } catch (error) {
      emit(
        SolvingRootState(
          status: SolvingStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> yellowCross() async {
    emit(
      SolvingRootState(
        status: SolvingStatus.loading,
      ),
    );
    try {
      final results = await solvingRepository.getYCModel();

      emit(
        SolvingRootState(
          results: results,
          status: SolvingStatus.yellowCross,
        ),
      );
    } catch (error) {
      emit(
        SolvingRootState(
          status: SolvingStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> permuteLastLayer() async {
    emit(
      SolvingRootState(
        status: SolvingStatus.loading,
      ),
    );
    try {
      final results = await solvingRepository.getPLLModel();

      emit(
        SolvingRootState(
          results: results,
          status: SolvingStatus.pll,
        ),
      );
    } catch (error) {
      emit(
        SolvingRootState(
          status: SolvingStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> orientLastLayer() async {
    emit(
      SolvingRootState(
        status: SolvingStatus.loading,
      ),
    );
    try {
      final results = await solvingRepository.getOLLModel();

      emit(
        SolvingRootState(
          results: results,
          status: SolvingStatus.oll,
        ),
      );
    } catch (error) {
      emit(
        SolvingRootState(
          status: SolvingStatus.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
