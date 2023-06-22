part of 'solving_root_cubit.dart';

@freezed
class SolvingRootState with _$SolvingRootState {
  factory SolvingRootState({
    @Default([]) List<SolvingModel> results,
    @Default(SolvingStatus.loading) SolvingStatus status,
    String? errorMessage,
  }) = _SolvingRootState;
}
