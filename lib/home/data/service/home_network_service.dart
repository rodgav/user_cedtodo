import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:user_cedtodo/startapp/application/constants.dart';

class HomeNetworkService {
  final Dio _dio;
  final Account _account;
  final Avatars _avatars;
  final Databases _databases;

  HomeNetworkService(this._dio, Client client)
      : _account = Account(client),
        _avatars = Avatars(client),
        _databases = Databases(client);

  Future<models.Account> getAccount() => _account.get();

  Future<Uint8List> getInitials() => _avatars.getInitials();

  Future<dynamic> deleteSession() =>
      _account.deleteSession(sessionId: 'current');

  Future<models.DocumentList> categories() => _databases.listDocuments(
      databaseId: Constants.dataBaseId,
      collectionId: Constants.categoriesId,
      queries: [Query.limit(50)]);

  Future<models.DocumentList> restaurants(List<String> queries) =>
      _databases.listDocuments(
          databaseId: Constants.dataBaseId,
          collectionId: Constants.restaurantsId,
          queries: queries);

  Future<models.Document> restaurant(String restaurantId) =>
      _databases.getDocument(
          databaseId: Constants.dataBaseId,
          collectionId: Constants.restaurantsId,
          documentId: restaurantId);

  Future<models.DocumentList> products(List<String> queries) =>
      _databases.listDocuments(
          databaseId: Constants.dataBaseId,
          collectionId: Constants.productsId,
          queries: queries);

  Future<models.Document> product(String productId) => _databases.getDocument(
      databaseId: Constants.dataBaseId,
      collectionId: Constants.productsId,
      documentId: productId);
}
