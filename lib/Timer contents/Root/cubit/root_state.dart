part of 'root_cubit.dart';

@immutable
class RootState {
  const RootState({
    required this.user,
    required this.index,
    required this.isLoading,
  });
  final int index;
  final User? user;
  final bool isLoading;
}
