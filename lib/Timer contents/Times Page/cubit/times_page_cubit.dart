import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:rubiks_timer/Timer%20contents/Times%20Page/times_model.dart';
import 'package:rubiks_timer/Timer%20contents/Times%20Page/times_repository.dart';
part 'times_page_state.dart';

@injectable
class TimesPageCubit extends Cubit<TimesPageState> {
  TimesPageCubit({required this.timesRepository})
      : super(
          const TimesPageState(
            times: [],
            errorMessage: '',
            isLoading: false,
          ),
        );
  final TimesRepository timesRepository;
  StreamSubscription? _streamSubscription;
  Future<void> start() async {
    emit(
      const TimesPageState(
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
