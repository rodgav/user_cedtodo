import 'package:appwrite/appwrite.dart';
import 'package:dio/dio.dart';
import 'package:user_cedtodo/main.dart';
import 'package:user_cedtodo/startapp/data/data_source/remote_datasource.dart';
import 'package:user_cedtodo/startapp/data/network/app_service.dart';
import 'package:user_cedtodo/startapp/data/network/appwrite_factory.dart';
import 'package:user_cedtodo/startapp/data/network/dio_factory.dart';
import 'package:user_cedtodo/startapp/internationalization/intl/l10n.dart';

Future<void> initModule() async {
  getIt.registerLazySingleton<S>(() => S());
  final dio = await DioFactory().getDio();
  final client = AppwriteFactory().getClient();
  getIt.registerLazySingleton<Dio>(() => dio);
  getIt.registerLazySingleton<Client>(() => client);
  getIt.registerLazySingleton<AppService>(() => AppService(dio, client));
  getIt.registerLazySingleton<RemoteDataSourceImpl>(
      () => RemoteDataSourceImpl(getIt<AppService>()));
}
