import 'package:appwrite/appwrite.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:user_cedtodo/main.dart';
import 'package:user_cedtodo/startapp/data/data_source/startapp_remote_datasource.dart';
import 'package:user_cedtodo/startapp/data/service/startapp_service.dart';
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
  getIt.registerLazySingleton<Dio>(() => dio);
  getIt.registerLazySingleton<Client>(() => client);
  if (!kIsWeb) {
    final internetConnectionChecker = InternetConnectionChecker();
    getIt.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(internetConnectionChecker));
  }
  getIt.registerLazySingleton<StartappService>(
      () => StartappService(dio, client));

  getIt.registerLazySingleton<StartappRemoteDataSource>(
      () => StartappRemoteDataSourceImpl(getIt<StartappService>()));

  getIt.registerLazySingleton<StartappRepository>(() => StartappRepositoryImpl(
      getIt<StartappRemoteDataSource>(),
      kIsWeb ? null : getIt<NetworkInfo>(),
      getIt<S>()));

  getIt.registerLazySingleton<GetSessionUseCase>(
      () => GetSessionUseCase(getIt<StartappRepository>()));

  getIt.registerLazySingleton<SplashViewModel>(
      () => SplashViewModel(getIt<GetSessionUseCase>()));
}
