import 'package:appwrite/appwrite.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:user_cedtodo/main.dart';
import 'package:user_cedtodo/startapp/data/data_source/startapp_local_datasource.dart';
import 'package:user_cedtodo/startapp/data/data_source/startapp_remote_datasource.dart';
import 'package:user_cedtodo/startapp/data/local/hive_factory.dart';
import 'package:user_cedtodo/startapp/data/service/startapp_hive_service.dart';
import 'package:user_cedtodo/startapp/data/service/startapp_network_service.dart';
import 'package:user_cedtodo/startapp/data/network/appwrite_factory.dart';
import 'package:user_cedtodo/startapp/data/network/dio_factory.dart';
import 'package:user_cedtodo/startapp/data/network/network_info.dart';
import 'package:user_cedtodo/startapp/data/repository/startapp_repository_impl.dart';
import 'package:user_cedtodo/startapp/domain/repository/startapp_repository.dart';
import 'package:user_cedtodo/startapp/domain/usecase/get_session.dart';
import 'package:user_cedtodo/startapp/internationalization/intl/l10n.dart';
import 'package:user_cedtodo/startapp/presentation/splash/splash_viewmodel.dart';

Future<void> initModule() async {
  getIt.registerLazySingleton<S>(() => S());
  final dio = await DioFactory().getDio();
  final client = AppwriteFactory().getClient();
  final sessionBox = await HiveFactory().initHive();
  getIt.registerLazySingleton<Dio>(() => dio);
  getIt.registerLazySingleton<Client>(() => client);
  getIt.registerLazySingleton<StartAppHiveService>(
          () => StartAppHiveService(sessionBox));

  if (!kIsWeb) {
    final internetConnectionChecker = InternetConnectionChecker();
    getIt.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(internetConnectionChecker));
  }
  getIt.registerLazySingleton<StartappNetworkService>(
      () => StartappNetworkService(dio, client));

  getIt.registerLazySingleton<StartappRemoteDataSource>(
      () => StartappRemoteDataSourceImpl(getIt<StartappNetworkService>()));

  getIt.registerLazySingleton<StartAppLocalDataSource>(
      () => StartAppLocalDataSourceImpl(getIt<StartAppHiveService>()));

  getIt.registerLazySingleton<StartappRepository>(() => StartappRepositoryImpl(
      getIt<StartappRemoteDataSource>(),
      getIt<StartAppLocalDataSource>(),
      kIsWeb ? null : getIt<NetworkInfo>(),
      getIt<S>()));

  getIt.registerLazySingleton<GetSessionUseCase>(
      () => GetSessionUseCase(getIt<StartappRepository>()));

  getIt.registerLazySingleton<SplashViewModel>(
      () => SplashViewModel(getIt<GetSessionUseCase>()));
}
