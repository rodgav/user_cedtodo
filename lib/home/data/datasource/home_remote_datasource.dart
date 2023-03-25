import 'package:appwrite/models.dart' as models;
import 'package:flutter/foundation.dart';
import 'package:user_cedtodo/home/data/service/home_service.dart';

abstract class HomeRemoteDataSource {
  Future<models.Account> getAccount();

  Future<Uint8List> getInitials();

  Future<dynamic> deleteSession();

  Future<models.DocumentList> categories();

  Future<models.DocumentList> restaurants(List<String> queries);

  Future<models.Document> restaurant(String restaurantId);

  Future<models.DocumentList> products(List<String> queries);

  Future<models.Document> product(String productId);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final HomeService _homeService;

  HomeRemoteDataSourceImpl(this._homeService);

  @override
  Future<models.Account> getAccount() => _homeService.getAccount();

  @override
  Future<Uint8List> getInitials() => _homeService.getInitials();

  @override
  Future<dynamic> deleteSession() => _homeService.deleteSession();

  @override
  Future<models.DocumentList> categories() => _homeService.categories();

  @override
  Future<models.DocumentList> restaurants(List<String> queries) =>
      _homeService.restaurants(queries);

  @override
  Future<models.Document> restaurant(String restaurantId) =>
      _homeService.restaurant(restaurantId);

  @override
  Future<models.DocumentList> products(List<String> queries) =>
      _homeService.products(queries);

  @override
  Future<models.Document> product(String productId) =>
      _homeService.product(productId);
}
