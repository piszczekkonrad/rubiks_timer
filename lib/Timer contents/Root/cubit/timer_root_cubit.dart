import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'timer_root_state.dart';
part 'timer_root_cubit.freezed.dart';

@injectable
class TimerRootCubit extends Cubit<TimerRootState> {
  TimerRootCubit()
      : super(
          TimerRootState(
            user: null,
            isLoading: false,
            index: 0,
          ),
        );
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
              TimerRootState(
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
