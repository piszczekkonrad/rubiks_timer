part of 'solving_root_cubit.dart';

@freezed
class SolvingRootState with _$SolvingRootState {
  factory SolvingRootState({
    @Default([]) List<SolvingModel> results,
    @Default(Status.loading) Status status,
    String? errorMessage,
  }) = _SolvingRootState;
}
