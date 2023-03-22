import 'package:appwrite/appwrite.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:user_cedtodo/authenticator/data/data_source/remote_datasource.dart';
import 'package:user_cedtodo/authenticator/data/repository/authenticator_repository_impl.dart';
import 'package:user_cedtodo/authenticator/data/service/authenticator_service.dart';
import 'package:user_cedtodo/authenticator/domain/repository/authenticator_repository.dart';
import 'package:user_cedtodo/authenticator/domain/usecases/create_email_session_usecase.dart';
import 'package:user_cedtodo/authenticator/domain/usecases/create_recovery_usecase.dart';
import 'package:user_cedtodo/authenticator/domain/usecases/create_usecase.dart';
import 'package:user_cedtodo/authenticator/domain/usecases/update_recovery_usecase.dart';
import 'package:user_cedtodo/main.dart';
import 'package:user_cedtodo/startapp/data/network/network_info.dart';
import 'package:user_cedtodo/startapp/internationalization/intl/l10n.dart';

void initAuthModule() {
  getIt.registerLazySingleton(
      () => AuthenticatorService(getIt<Dio>(), getIt<Client>()));

  getIt.registerLazySingleton<AuthenticatorRemoteDataSource>(
      () => AuthenticatorRemoteDataSourceImpl(getIt<AuthenticatorService>()));

  getIt.registerLazySingleton<AuthenticatorRepository>(() =>
      AuthenticatorRepositoryImpl(getIt<AuthenticatorRemoteDataSource>(),
          kIsWeb ? null : getIt<NetworkInfo>(), getIt<S>()));

  getIt.registerLazySingleton<CreateUseCase>(
      () => CreateUseCase(getIt<AuthenticatorRepository>()));

  getIt.registerLazySingleton(
      () => CreateEmailSessionUseCase(getIt<AuthenticatorRepository>()));

  getIt.registerLazySingleton(
      () => CreateRecoveryUseCase(getIt<AuthenticatorRepository>()));

  getIt.registerLazySingleton(
      () => UpdateRecoveryUseCase(getIt<AuthenticatorRepository>()));
}
