import 'package:appwrite/models.dart' as models;
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:user_cedtodo/home/domain/model/categories_model.dart';
import 'package:user_cedtodo/home/domain/model/products_model.dart';
import 'package:user_cedtodo/home/domain/model/restaurants_model.dart';
import 'package:user_cedtodo/startapp/data/network/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, models.Account>> getAccount();

  Future<Either<Failure, Uint8List>> getInitials();

  Future<Either<Failure, dynamic>> deleteSession();

  Future<Either<Failure, CategoriesModel>> categories();

  Future<Either<Failure, RestaurantsModel>> restaurants(List<String> queries);

  Future<Either<Failure, RestaurantDataModel>> restaurant(String restaurantId);

  Future<Either<Failure, ProductsModel>> products(List<String> queries);

  Future<Either<Failure, ProductDataModel>> product(String productId);
}
