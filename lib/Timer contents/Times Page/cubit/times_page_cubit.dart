import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rubiks_timer/Timer%20contents/Times%20Page/times_model.dart';
import 'package:rubiks_timer/Timer%20contents/Times%20Page/times_repository.dart';
part 'times_page_state.dart';
part 'times_page_cubit.freezed.dart';

@injectable
class TimesPageCubit extends Cubit<TimesPageState> {
  TimesPageCubit({required this.timesRepository})
      : super(
          TimesPageState(
            times: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  final TimesRepository timesRepository;
  StreamSubscription? _streamSubscription;
  Future<void> start() async {
    emit(
      TimesPageState(
        times: [],
        errorMessage: '',
        isLoading: true,
      ),
    );
    _streamSubscription = timesRepository.getStream().listen((timeModels) {
      emit(
        TimesPageState(
          times: timeModels,
          errorMessage: '',
          isLoading: false,
        ),
      );
    })
      ..onError((error) {
        emit(
          TimesPageState(
            times: const [],
            errorMessage: error.toString(),
            isLoading: false,
          ),
        );
      });
  }

  Future<void> delete(id) async {
    await timesRepository.delete(id: id);
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
