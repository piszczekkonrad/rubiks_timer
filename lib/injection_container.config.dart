// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'injection_container.dart' as _i13;
import 'Solving/Solving%20Root/cubit/solving_root_cubit.dart' as _i10;
import 'Solving/solving_remote_data_source.dart' as _i8;
import 'Solving/solving_repository.dart' as _i9;
import 'Timer%20contents/Root/cubit/timer_root_cubit.dart' as _i4;
import 'Timer%20contents/timer/cubit/timer_cubit.dart' as _i11;
import 'Timer%20contents/timer/timer_repository.dart' as _i3;
import 'Timer%20contents/Times%20Page/cubit/times_page_cubit.dart' as _i12;
import 'Timer%20contents/Times%20Page/times_remote_data_source.dart' as _i5;
import 'Timer%20contents/Times%20Page/times_repository.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<String>(
    () => registerModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.factory<_i3.TimerRepository>(() => _i3.TimerRepository());
  gh.factory<_i4.TimerRootCubit>(() => _i4.TimerRootCubit());
  gh.factory<_i5.TimesDataSource>(() => _i5.TimesDataSource());
  gh.factory<_i6.TimesRepository>(
      () => _i6.TimesRepository(timesDataSource: get<_i5.TimesDataSource>()));
  gh.lazySingleton<_i7.Dio>(
      () => registerModule.dio(get<String>(instanceName: 'BaseUrl')));
  gh.factory<_i8.SolvingRemoteRetrofitDataSource>(
      () => _i8.SolvingRemoteRetrofitDataSource(get<_i7.Dio>()));
  gh.factory<_i9.SolvingRepository>(() => _i9.SolvingRepository(
      solvingRemoteDataSource: get<_i8.SolvingRemoteRetrofitDataSource>()));
  gh.factory<_i10.SolvingRootCubit>(() =>
      _i10.SolvingRootCubit(solvingRepository: get<_i9.SolvingRepository>()));
  gh.factory<_i11.TimerCubit>(
      () => _i11.TimerCubit(timerRepository: get<_i3.TimerRepository>()));
  gh.factory<_i12.TimesPageCubit>(
      () => _i12.TimesPageCubit(timesRepository: get<_i6.TimesRepository>()));
  return get;
}

class _$RegisterModule extends _i13.RegisterModule {}
