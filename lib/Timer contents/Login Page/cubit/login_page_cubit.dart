import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../enums.dart';

part 'login_page_state.dart';
part 'login_page_cubit.freezed.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit()
      : super(LoginPageState(
          loginStatus: LoginStatus.login,
        ));
}
