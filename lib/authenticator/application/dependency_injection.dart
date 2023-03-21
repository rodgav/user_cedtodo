import 'package:appwrite/appwrite.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:user_cedtodo/authenticator/data/data_source/remote_datasource.dart';
import 'package:user_cedtodo/authenticator/data/repository/authenticator_repository.dart';
import 'package:user_cedtodo/authenticator/data/service/authenticator_service.dart';
import 'package:user_cedtodo/main.dart';
import 'package:user_cedtodo/startapp/data/network/network_info.dart';
import 'package:user_cedtodo/startapp/internationalization/intl/l10n.dart';

void initAuthModule() {
  getIt.registerLazySingleton(
      () => AuthenticatorService(getIt<Dio>(), getIt<Client>()));
  getIt.registerLazySingleton<AuthenticatorRemoteDataSourceImpl>(
      () => AuthenticatorRemoteDataSourceImpl(getIt<AuthenticatorService>()));
  getIt.registerLazySingleton(() => AuthenticatorRepositoryImpl(
      getIt<AuthenticatorRemoteDataSourceImpl>(), kIsWeb? null: getIt<NetworkInfoImpl>(), getIt<S>()));
}
