// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'injection_container.dart' as _i16;
import 'Solving/Solving%20Root/cubit/solving_root_cubit.dart' as _i13;
import 'Solving/solving_remote_data_source.dart' as _i11;
import 'Solving/solving_repository.dart' as _i12;
import 'Timer%20contents/Login%20Page/cubit/login_page_cubit.dart' as _i10;
import 'Timer%20contents/Login%20Page/login_repository.dart' as _i3;
import 'Timer%20contents/Root/cubit/timer_root_cubit.dart' as _i6;
import 'Timer%20contents/timer/cubit/timer_cubit.dart' as _i14;
import 'Timer%20contents/timer/timer_remote_data_source.dart' as _i4;
import 'Timer%20contents/timer/timer_repository.dart' as _i5;
import 'Timer%20contents/Times%20Page/cubit/times_page_cubit.dart' as _i15;
import 'Timer%20contents/Times%20Page/times_remote_data_source.dart' as _i7;
import 'Timer%20contents/Times%20Page/times_repository.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i3.LoginRepository>(() => _i3.LoginRepository());
  gh.factory<String>(
    () => registerModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.factory<_i4.TimerRemoteDataSource>(() => _i4.TimerRemoteDataSource());
  gh.factory<_i5.TimerRepository>(
      () => _i5.TimerRepository(get<_i4.TimerRemoteDataSource>()));
  gh.factory<_i6.TimerRootCubit>(
      () => _i6.TimerRootCubit(get<_i3.LoginRepository>()));
  gh.factory<_i7.TimesDataSource>(() => _i7.TimesDataSource());
  gh.factory<_i8.TimesRepository>(
      () => _i8.TimesRepository(timesDataSource: get<_i7.TimesDataSource>()));
  gh.lazySingleton<_i9.Dio>(
      () => registerModule.dio(get<String>(instanceName: 'BaseUrl')));
  gh.factory<_i10.LoginPageCubit>(
      () => _i10.LoginPageCubit(get<_i3.LoginRepository>()));
  gh.factory<_i11.SolvingRemoteRetrofitDataSource>(
      () => _i11.SolvingRemoteRetrofitDataSource(get<_i9.Dio>()));
  gh.factory<_i12.SolvingRepository>(() => _i12.SolvingRepository(
      solvingRemoteDataSource: get<_i11.SolvingRemoteRetrofitDataSource>()));
  gh.factory<_i13.SolvingRootCubit>(() =>
      _i13.SolvingRootCubit(solvingRepository: get<_i12.SolvingRepository>()));
  gh.factory<_i14.TimerCubit>(
      () => _i14.TimerCubit(timerRepository: get<_i5.TimerRepository>()));
  gh.factory<_i15.TimesPageCubit>(
      () => _i15.TimesPageCubit(timesRepository: get<_i8.TimesRepository>()));
  return get;
}

class _$RegisterModule extends _i16.RegisterModule {}
