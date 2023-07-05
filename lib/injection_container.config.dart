// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'injection_container.dart' as _i17;
import 'Solving/Solving%20Root/cubit/solving_root_cubit.dart' as _i14;
import 'Solving/solving_remote_data_source.dart' as _i12;
import 'Solving/solving_repository.dart' as _i13;
import 'Timer%20contents/Login%20Page/cubit/login_page_cubit.dart' as _i11;
import 'Timer%20contents/Login%20Page/login_remote_data_source.dart' as _i3;
import 'Timer%20contents/Login%20Page/login_repository.dart' as _i4;
import 'Timer%20contents/Root/cubit/timer_root_cubit.dart' as _i7;
import 'Timer%20contents/timer/cubit/timer_cubit.dart' as _i15;
import 'Timer%20contents/timer/timer_remote_data_source.dart' as _i5;
import 'Timer%20contents/timer/timer_repository.dart' as _i6;
import 'Timer%20contents/Times%20Page/cubit/times_page_cubit.dart' as _i16;
import 'Timer%20contents/Times%20Page/times_remote_data_source.dart' as _i8;
import 'Timer%20contents/Times%20Page/times_repository.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i3.LoginRemoteDataSource>(() => _i3.LoginRemoteDataSource());
  gh.factory<_i4.LoginRepository>(
      () => _i4.LoginRepository(get<_i3.LoginRemoteDataSource>()));
  gh.factory<String>(
    () => registerModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.factory<_i5.TimerRemoteDataSource>(() => _i5.TimerRemoteDataSource());
  gh.factory<_i6.TimerRepository>(
      () => _i6.TimerRepository(get<_i5.TimerRemoteDataSource>()));
  gh.factory<_i7.TimerRootCubit>(
      () => _i7.TimerRootCubit(get<_i4.LoginRepository>()));
  gh.factory<_i8.TimesDataSource>(() => _i8.TimesDataSource());
  gh.factory<_i9.TimesRepository>(
      () => _i9.TimesRepository(timesDataSource: get<_i8.TimesDataSource>()));
  gh.lazySingleton<_i10.Dio>(
      () => registerModule.dio(get<String>(instanceName: 'BaseUrl')));
  gh.factory<_i11.LoginPageCubit>(
      () => _i11.LoginPageCubit(get<_i4.LoginRepository>()));
  gh.factory<_i12.SolvingRemoteRetrofitDataSource>(
      () => _i12.SolvingRemoteRetrofitDataSource(get<_i10.Dio>()));
  gh.factory<_i13.SolvingRepository>(() => _i13.SolvingRepository(
      solvingRemoteDataSource: get<_i12.SolvingRemoteRetrofitDataSource>()));
  gh.factory<_i14.SolvingRootCubit>(() =>
      _i14.SolvingRootCubit(solvingRepository: get<_i13.SolvingRepository>()));
  gh.factory<_i15.TimerCubit>(
      () => _i15.TimerCubit(timerRepository: get<_i6.TimerRepository>()));
  gh.factory<_i16.TimesPageCubit>(
      () => _i16.TimesPageCubit(timesRepository: get<_i9.TimesRepository>()));
  return get;
}

class _$RegisterModule extends _i17.RegisterModule {}
