import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rubiks_timer/Timer%20contents/Login%20Page/login_repository.dart';

part 'timer_root_state.dart';
part 'timer_root_cubit.freezed.dart';

@injectable
class TimerRootCubit extends Cubit<TimerRootState> {
  TimerRootCubit(this._loginRepository)
      : super(
          TimerRootState(
            user: null,
            isLoading: false,
            index: 0,
          ),
        );
  final LoginRepository _loginRepository;
  // ignore: unused_field
  StreamSubscription? _streamSubscription;
  Future<void> start() async {
    emit(
      TimerRootState(
        user: null,
        isLoading: false,
        index: 0,
      ),
    );
    _streamSubscription = _loginRepository.getUserStream().listen((user) {
      emit(
        TimerRootState(
          user: user,
          isLoading: false,
          index: 0,
        ),
      );
    })
      ..onError((error) {
        emit(
          TimerRootState(
            user: null,
            isLoading: false,
            index: 0,
          ),
        );
      });
  }

  Future<void> signOut() async {
    _loginRepository.signOut();
  }

  Future<void> setIndex(newIndex) async {
    _streamSubscription = _loginRepository.getUserStream().listen(
      (user) {
        emit(
          TimerRootState(
            index: newIndex,
            user: user,
            isLoading: false,
          ),
        );
      },
    );
  }
}
