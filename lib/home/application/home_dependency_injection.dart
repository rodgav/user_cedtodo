import 'package:appwrite/appwrite.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:user_cedtodo/home/data/datasource/home_local_datasource.dart';
import 'package:user_cedtodo/home/data/datasource/home_remote_datasource.dart';
import 'package:user_cedtodo/home/data/local/adapters/cart_adapter.dart';
import 'package:user_cedtodo/home/data/repository/home_repository_impl.dart';
import 'package:user_cedtodo/home/data/service/home_hive_service.dart';
import 'package:user_cedtodo/home/data/service/home_network_service.dart';
import 'package:user_cedtodo/home/domain/repository/home_repository.dart';
import 'package:user_cedtodo/home/domain/usecases/clear_cart_usecase.dart';
import 'package:user_cedtodo/home/domain/usecases/delete_session_usecase.dart';
import 'package:user_cedtodo/home/domain/usecases/get_account_usecase.dart';
import 'package:user_cedtodo/home/domain/usecases/get_cart_usecase.dart';
import 'package:user_cedtodo/home/domain/usecases/get_categories_usecase.dart';
import 'package:user_cedtodo/home/domain/usecases/get_initials_usecase.dart';
import 'package:user_cedtodo/home/domain/usecases/get_products_usecase.dart';
import 'package:user_cedtodo/home/domain/usecases/get_restaurant_usecase.dart';
import 'package:user_cedtodo/home/domain/usecases/get_restaurants_usecase.dart';
import 'package:user_cedtodo/home/domain/usecases/put_cart_usecase.dart';
import 'package:user_cedtodo/home/presentation/home/pages/cart/cart_viewmodel.dart';
import 'package:user_cedtodo/home/presentation/home/pages/profile/profile_viewmodel.dart';
import 'package:user_cedtodo/home/presentation/home/pages/restaurant/restaurant_viewmodel.dart';
import 'package:user_cedtodo/home/presentation/home/pages/restaurants/restaurants_viewmodel.dart';
import 'package:user_cedtodo/main.dart';
import 'package:user_cedtodo/startapp/data/network/network_info.dart';
import 'package:user_cedtodo/startapp/internationalization/intl/l10n.dart';

void initHomeModule() async {
  if (!GetIt.I.isRegistered<HomeNetworkService>()) {
    getIt.registerLazySingleton<HomeHiveService>(
        () => HomeHiveService(getIt<Box<CartAdapter>>()));

    getIt.registerLazySingleton<HomeLocalDataSource>(
        () => HomeLocalDataSourceImpl(getIt<HomeHiveService>()));

    getIt.registerLazySingleton<HomeNetworkService>(
        () => HomeNetworkService(getIt<Dio>(), getIt<Client>()));

    getIt.registerLazySingleton<HomeRemoteDataSource>(
        () => HomeRemoteDataSourceImpl(getIt<HomeNetworkService>()));

    getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(
        getIt<HomeRemoteDataSource>(),
        getIt<HomeLocalDataSource>(),
        kIsWeb ? null : getIt<NetworkInfo>(),
        getIt<S>()));
  }
}

Future<void> initProfile() async {
  initHomeModule();
  if (!GetIt.I.isRegistered<GetAccountUseCase>()) {
    getIt.registerLazySingleton<GetAccountUseCase>(
        () => GetAccountUseCase(getIt<HomeRepository>()));
    getIt.registerLazySingleton<GetInitialsUseCase>(
        () => GetInitialsUseCase(getIt<HomeRepository>()));
    getIt.registerLazySingleton<DeleteSessionUseCase>(
        () => DeleteSessionUseCase(getIt<HomeRepository>()));
    getIt.registerLazySingleton<ProfileViewModel>(() => ProfileViewModel(
        getIt<DeleteSessionUseCase>(),
        getIt<GetAccountUseCase>(),
        getIt<GetInitialsUseCase>()));
  }
}

void initRestaurants() async {
  initHomeModule();
  if (!GetIt.I.isRegistered<GetCategoriesUseCase>()) {
    getIt.registerLazySingleton<GetCategoriesUseCase>(
        () => GetCategoriesUseCase(getIt<HomeRepository>()));
    getIt.registerLazySingleton<GetRestaurantsUseCase>(
        () => GetRestaurantsUseCase(getIt<HomeRepository>()));
    getIt.registerLazySingleton<RestaurantsViewModel>(() =>
        RestaurantsViewModel(
            getIt<GetCategoriesUseCase>(), getIt<GetRestaurantsUseCase>()));
  }
}

void initRestaurant() async {
  initHomeModule();
  _initCartUseCases();
  if (!GetIt.I.isRegistered<GetRestaurantUseCase>()) {
    getIt.registerLazySingleton<GetRestaurantUseCase>(
        () => GetRestaurantUseCase(getIt<HomeRepository>()));
    getIt.registerLazySingleton<GetProductsUseCase>(
        () => GetProductsUseCase(getIt<HomeRepository>()));
    getIt.registerLazySingleton<RestaurantViewModel>(() => RestaurantViewModel(
        getIt<GetRestaurantUseCase>(),
        getIt<GetProductsUseCase>(),
        getIt<GetCartUseCase>(),
        getIt<PutCartUseCase>(),
        getIt<ClearCartUseCase>()));
  }
}

void _initCartUseCases() {
  if (!GetIt.I.isRegistered<GetCartUseCase>()) {
    getIt.registerLazySingleton<GetCartUseCase>(
        () => GetCartUseCase(getIt<HomeRepository>()));
    getIt.registerLazySingleton<PutCartUseCase>(
        () => PutCartUseCase(getIt<HomeRepository>()));
    getIt.registerLazySingleton<ClearCartUseCase>(
        () => ClearCartUseCase(getIt<HomeRepository>()));
  }
}

void initCart() {
  initHomeModule();
  _initCartUseCases();
  if (!GetIt.I.isRegistered<CartViewModel>()) {
    getIt.registerLazySingleton(() => CartViewModel(
        getIt<GetCartUseCase>(),
        getIt<PutCartUseCase>(),
        getIt<ClearCartUseCase>(),
        GetIt.I.isRegistered<HomeRepository>()
            ? getIt<RestaurantViewModel>()
            : null));
  }
}
