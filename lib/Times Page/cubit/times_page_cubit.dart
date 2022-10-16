import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rubiks_timer/Times%20Page/times_model.dart';
import 'package:rubiks_timer/Times%20Page/times_repository.dart';
part 'times_page_state.dart';

class TimesPageCubit extends Cubit<TimesPageState> {
  TimesPageCubit(this._timesRepository)
      : super(
          const TimesPageState(
            times: [],
            errorMessage: '',
            isLoading: false,
          ),
        );
  final TimesRepository _timesRepository;
  StreamSubscription? _streamSubscription;
  Future<void> start() async {
    emit(
      const TimesPageState(
        times: [],
        errorMessage: '',
        isLoading: true,
      ),
    );
    _streamSubscription = _timesRepository.getStream().listen((timeModels) {
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
    await _timesRepository.delete(id: id);
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
