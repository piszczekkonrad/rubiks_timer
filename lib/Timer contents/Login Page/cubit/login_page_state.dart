part of 'login_page_cubit.dart';

@freezed
class LoginPageState with _$LoginPageState {
  factory LoginPageState({
    required LoginStatus loginStatus,
    @Default("") String errorMessage,
  }) = _LoginPageState;
}
