import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit()
      : super(
          const RootState(
            user: null,
            isLoading: false,
            index: 0,
          ),
        );
  StreamSubscription? _streamSubscription;
  Future<void> start() async {
    emit(
      const RootState(
        user: null,
        isLoading: false,
        index: 0,
      ),
    );
    _streamSubscription =
        FirebaseAuth.instance.authStateChanges().listen((user) {
      emit(
        RootState(
          user: user,
          isLoading: false,
          index: 0,
        ),
      );
    })
          ..onError((error) {
            emit(
              const RootState(
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
          RootState(
            index: newIndex,
            user: user,
            isLoading: false,
          ),
        );
      },
    );
  }
}
