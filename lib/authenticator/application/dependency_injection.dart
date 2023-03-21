import 'package:appwrite/appwrite.dart';
import 'package:dio/dio.dart';
import 'package:user_cedtodo/authenticator/data/service/authenticator_service.dart';
import 'package:user_cedtodo/main.dart';

void initAuthModule() {
  getIt.registerLazySingleton(() => AuthenticatorService(getIt<Dio>(), getIt<Client>()));
}
