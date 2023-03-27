import 'dart:typed_data';

import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:user_cedtodo/home/data/datasource/home_local_datasource.dart';
import 'package:user_cedtodo/home/data/datasource/home_remote_datasource.dart';
import 'package:user_cedtodo/home/data/mapper/categories_mapper.dart';
import 'package:user_cedtodo/home/data/mapper/products_mapper.dart';
import 'package:user_cedtodo/home/data/mapper/restaurants_mapper.dart';
import 'package:user_cedtodo/home/data/responses/categories_response.dart';
import 'package:user_cedtodo/home/data/responses/products_response.dart';
import 'package:user_cedtodo/home/data/responses/restaurants_response.dart';
import 'package:user_cedtodo/home/domain/model/categories_model.dart';
import 'package:user_cedtodo/home/domain/model/products_model.dart';
import 'package:user_cedtodo/home/domain/model/restaurants_model.dart';
import 'package:user_cedtodo/home/domain/repository/home_repository.dart';
import 'package:user_cedtodo/startapp/data/network/error_handler.dart';
import 'package:user_cedtodo/startapp/data/network/failure.dart';
import 'package:user_cedtodo/startapp/data/network/network_info.dart';
import 'package:user_cedtodo/startapp/internationalization/intl/l10n.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;
  final HomeLocalDataSource _homeLocalDataSource;
  final NetworkInfo? _networkInfo;
  final S _s;

  HomeRepositoryImpl(this._homeRemoteDataSource, this._homeLocalDataSource,
      this._networkInfo, this._s);

  @override
  Future<Either<Failure, Account>> getAccount() async {
    if (await _networkInfo?.isConnected ?? true) {
      try {
        final account = await _homeRemoteDataSource.getAccount();
        return Right(account);
      } catch (e) {
        return Left(ErrorHandler.handle(e, _s).failure);
      }
    } else {
      return Left(DataSource.no_internet_connection.getFailure(0, _s));
    }
  }

  @override
  Future<Either<Failure, Uint8List>> getInitials() async {
    if (await _networkInfo?.isConnected ?? true) {
      try {
        final initials = await _homeRemoteDataSource.getInitials();
        return Right(initials);
      } catch (e) {
        return Left(ErrorHandler.handle(e, _s).failure);
      }
    } else {
      return Left(DataSource.no_internet_connection.getFailure(0, _s));
    }
  }

  @override
  Future<Either<Failure, dynamic>> deleteSession() async {
    if (await _networkInfo?.isConnected ?? true) {
      try {
        final deleteSession = await _homeRemoteDataSource.deleteSession();
        return Right(deleteSession);
      } catch (e) {
        return Left(ErrorHandler.handle(e, _s).failure);
      }
    } else {
      return Left(DataSource.no_internet_connection.getFailure(0, _s));
    }
  }

  @override
  Future<Either<Failure, CategoriesModel>> categories() async {
    if (await _networkInfo?.isConnected ?? true) {
      try {
        final categories = await _homeRemoteDataSource.categories();
        final categoriesResponse =
            CategoriesResponse.fromJson(categories.toMap());
        final categoriesModel = categoriesResponse.toDomain();
        return Right(categoriesModel);
      } catch (e) {
        return Left(ErrorHandler.handle(e, _s).failure);
      }
    } else {
      return Left(DataSource.no_internet_connection.getFailure(0, _s));
    }
  }

  @override
  Future<Either<Failure, RestaurantsModel>> restaurants(
      List<String> queries) async {
    if (await _networkInfo?.isConnected ?? true) {
      try {
        final restaurants = await _homeRemoteDataSource.restaurants(queries);
        final restaurantsResponse =
            RestaurantsResponse.fromJson(restaurants.toMap());
        final restaurantsModel = restaurantsResponse.toDomain();
        return Right(restaurantsModel);
      } catch (e) {
        return Left(ErrorHandler.handle(e, _s).failure);
      }
    } else {
      return Left(DataSource.no_internet_connection.getFailure(0, _s));
    }
  }

  @override
  Future<Either<Failure, RestaurantDataModel>> restaurant(
      String restaurantId) async {
    if (await _networkInfo?.isConnected ?? true) {
      try {
        final restaurant = await _homeRemoteDataSource.restaurant(restaurantId);
        final restaurantDataResponse =
            RestaurantDataResponse.fromJson(restaurant.toMap());
        final restaurantDataModel = restaurantDataResponse.toDomain();
        return Right(restaurantDataModel);
      } catch (e) {
        return Left(ErrorHandler.handle(e, _s).failure);
      }
    } else {
      return Left(DataSource.no_internet_connection.getFailure(0, _s));
    }
  }

  @override
  Future<Either<Failure, ProductsModel>> products(List<String> queries) async {
    if (await _networkInfo?.isConnected ?? true) {
      try {
        final products = await _homeRemoteDataSource.products(queries);
        final productsResponse = ProductsResponse.fromJson(products.toMap());
        final productsModel = productsResponse.toDomain();
        return Right(productsModel);
      } catch (e) {
        return Left(ErrorHandler.handle(e, _s).failure);
      }
    } else {
      return Left(DataSource.no_internet_connection.getFailure(0, _s));
    }
  }

  @override
  Future<Either<Failure, ProductDataModel>> product(String productId) async {
    if (await _networkInfo?.isConnected ?? true) {
      try {
        final product = await _homeRemoteDataSource.product(productId);
        final productDataResponse =
            ProductDataResponse.fromJson(product.toMap());
        final productDataModel = productDataResponse.toDomain();
        return Right(productDataModel);
      } catch (e) {
        return Left(ErrorHandler.handle(e, _s).failure);
      }
    } else {
      return Left(DataSource.no_internet_connection.getFailure(0, _s));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getCart() async {
    final listProducts = await _homeLocalDataSource.getCart();
    if (listProducts != null) {
      return Right(listProducts);
    } else {
      return Left(DataSource.cache_error.getFailure(0, _s));
    }
  }

  @override
  Future<Either<Failure, ProductModel>> putCart(
      ProductModel productModel) async {
    final newProductModel =
        await _homeLocalDataSource.putCart(productModel);
    if (newProductModel != null) {
      return Right(newProductModel);
    } else {
      return Left(DataSource.cache_error.getFailure(0, _s));
    }
  }
}
