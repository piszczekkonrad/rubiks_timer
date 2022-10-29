import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'timer_root_state.dart';

@injectable
class TimerRootCubit extends Cubit<TimerRootState> {
  TimerRootCubit()
      : super(
          const TimerRootState(
            user: null,
            isLoading: false,
            index: 0,
          ),
        );
  StreamSubscription? _streamSubscription;
  Future<void> start() async {
    emit(
      const TimerRootState(
        user: null,
        isLoading: false,
        index: 0,
      ),
    );
    _streamSubscription =
        FirebaseAuth.instance.authStateChanges().listen((user) {
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
              const TimerRootState(
                user: null,
                isLoading: false,
                index: 0,
              ),
            );
          });
  }

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }

  Future<void> setIndex(newIndex) async {
    _streamSubscription = FirebaseAuth.instance.authStateChanges().listen(
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
