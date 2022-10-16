part of 'times_page_cubit.dart';

@immutable
class TimesPageState {
  const TimesPageState({
    required this.times,
    required this.isLoading,
    required this.errorMessage,
  });
  final List<TimesModel> times;
  final bool isLoading;
  final String errorMessage;
}
