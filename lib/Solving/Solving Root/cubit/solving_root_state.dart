part of 'solving_root_cubit.dart';

@immutable
class SolvingRootState {
  const SolvingRootState({
    this.results = const [],
    this.status = Status.loading,
    this.errorMessage,
  });
  final List results;
  final Status status;
  final String? errorMessage;
}
