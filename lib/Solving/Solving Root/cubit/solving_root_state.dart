part of 'solving_root_cubit.dart';

@immutable
class SolvingRootState {
  const SolvingRootState({
    this.test = "",
    this.results,
    this.status = Status.loading,
    this.errorMessage,
  });
  final SolvingModel? results;
  final Status status;
  final String? errorMessage;
  final String test;
}
