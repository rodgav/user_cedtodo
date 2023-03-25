import 'package:appwrite/appwrite.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:user_cedtodo/home/data/datasource/home_remote_datasource.dart';
import 'package:user_cedtodo/home/data/repository/home_repository_impl.dart';
import 'package:user_cedtodo/home/data/service/home_service.dart';
import 'package:user_cedtodo/home/domain/repository/home_repository.dart';
import 'package:user_cedtodo/home/domain/usecases/delete_session_usecase.dart';
import 'package:user_cedtodo/home/domain/usecases/get_account_usecase.dart';
import 'package:user_cedtodo/home/domain/usecases/get_categories_usecase.dart';
import 'package:user_cedtodo/home/domain/usecases/get_initials_usecase.dart';
import 'package:user_cedtodo/home/domain/usecases/get_restaurant_usecase.dart';
import 'package:user_cedtodo/home/domain/usecases/get_restaurants_usecase.dart';
import 'package:user_cedtodo/home/presentation/home/pages/profile/profile_viewmodel.dart';
import 'package:user_cedtodo/home/presentation/home/pages/restaurant/restaurant_viewmodel.dart';
import 'package:user_cedtodo/home/presentation/home/pages/restaurants/restaurants_viewmodel.dart';
import 'package:user_cedtodo/main.dart';
import 'package:user_cedtodo/startapp/data/network/network_info.dart';
import 'package:user_cedtodo/startapp/internationalization/intl/l10n.dart';

void initHomeModule() {
  if (!GetIt.I.isRegistered<HomeService>()) {
    getIt.registerLazySingleton<HomeService>(
        () => HomeService(getIt<Dio>(), getIt<Client>()));
    getIt.registerLazySingleton<HomeRemoteDataSource>(
        () => HomeRemoteDataSourceImpl(getIt<HomeService>()));
    getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(
        getIt<HomeRemoteDataSource>(),
        kIsWeb ? null : getIt<NetworkInfo>(),
        getIt<S>()));
  }
}

void initProfile() {
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

void initRestaurants() {
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

void initRestaurant() {
  initHomeModule();
  if (!GetIt.I.isRegistered<GetRestaurantUseCase>()) {
    getIt.registerLazySingleton<GetRestaurantUseCase>(
        () => GetRestaurantUseCase(getIt<HomeRepository>()));
    getIt.registerLazySingleton<RestaurantViewModel>(
        () => RestaurantViewModel(getIt<GetRestaurantUseCase>()));
  }
}
