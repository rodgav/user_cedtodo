import 'package:appwrite/appwrite.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:user_cedtodo/authenticator/data/data_source/remote_datasource.dart';
import 'package:user_cedtodo/authenticator/data/repository/authenticator_repository_impl.dart';
import 'package:user_cedtodo/authenticator/data/service/authenticator_service.dart';
import 'package:user_cedtodo/authenticator/domain/repository/authenticator_repository.dart';
import 'package:user_cedtodo/authenticator/domain/usecases/create_email_session_usecase.dart';
import 'package:user_cedtodo/authenticator/domain/usecases/create_recovery_usecase.dart';
import 'package:user_cedtodo/authenticator/domain/usecases/create_usecase.dart';
import 'package:user_cedtodo/authenticator/domain/usecases/update_recovery_usecase.dart';
import 'package:user_cedtodo/authenticator/presentation/login/login_viewmodel.dart';
import 'package:user_cedtodo/authenticator/presentation/recover_password/recover_password_viewmodel.dart';
import 'package:user_cedtodo/authenticator/presentation/recover_password_confirm/recover_password_confirm_viewmodel.dart';
import 'package:user_cedtodo/authenticator/presentation/register/register_viewmodel.dart';
import 'package:user_cedtodo/main.dart';
import 'package:user_cedtodo/startapp/data/network/network_info.dart';
import 'package:user_cedtodo/startapp/internationalization/intl/l10n.dart';

void initAuthModule() {
  if (!GetIt.instance.isRegistered<AuthenticatorService>()) {
    getIt.registerLazySingleton(
        () => AuthenticatorService(getIt<Dio>(), getIt<Client>()));

    getIt.registerLazySingleton<AuthenticatorRemoteDataSource>(
        () => AuthenticatorRemoteDataSourceImpl(getIt<AuthenticatorService>()));

    getIt.registerLazySingleton<AuthenticatorRepository>(() =>
        AuthenticatorRepositoryImpl(getIt<AuthenticatorRemoteDataSource>(),
            kIsWeb ? null : getIt<NetworkInfo>(), getIt<S>()));
  }
}

void initLogin() {
  initAuthModule();
  if (!GetIt.instance.isRegistered<CreateEmailSessionUseCase>()) {
    getIt.registerLazySingleton<CreateEmailSessionUseCase>(
        () => CreateEmailSessionUseCase(getIt<AuthenticatorRepository>()));
    getIt.registerLazySingleton<LoginViewModel>(
        () => LoginViewModel(getIt<CreateEmailSessionUseCase>()));
  }
}

void initRecoverPassword() {
  initAuthModule();
  if (!GetIt.instance.isRegistered<CreateRecoveryUseCase>()) {
    getIt.registerLazySingleton<CreateRecoveryUseCase>(
        () => CreateRecoveryUseCase(getIt<AuthenticatorRepository>()));
    getIt.registerLazySingleton(
        () => RecoverPasswordViewModel(getIt<CreateRecoveryUseCase>()));
  }
}

void initRecoverPasswordConfirm() {
  initAuthModule();
  if (!GetIt.instance.isRegistered<UpdateRecoveryUseCase>()) {
    getIt.registerLazySingleton<UpdateRecoveryUseCase>(
        () => UpdateRecoveryUseCase(getIt<AuthenticatorRepository>()));
    getIt.registerLazySingleton(
        () => RecoverPasswordConfirmViewModel(getIt<UpdateRecoveryUseCase>()));
  }
}

void initRegister() {
  initAuthModule();
  if (!GetIt.instance.isRegistered<CreateUseCase>()) {
    getIt.registerLazySingleton<CreateUseCase>(
        () => CreateUseCase(getIt<AuthenticatorRepository>()));
    getIt
        .registerLazySingleton(() => RegisterViewModel(getIt<CreateUseCase>()));
  }
}
