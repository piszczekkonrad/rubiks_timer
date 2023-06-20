part of 'times_page_cubit.dart';

@freezed
class TimesPageState with _$TimesPageState {
  factory TimesPageState({
    required List<TimesModel> times,
    required bool isLoading,
    required String errorMessage,
  }) = _TimesPageState;
}
