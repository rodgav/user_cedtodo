import 'package:user_cedtodo/home/domain/model/base_model.dart';

class ProductsModel extends BaseTotalModel {
  List<ProductDataModel>? productsDataModel;

  ProductsModel({required this.productsDataModel, required int total})
      : super(total: total);
}

class ProductDataModel extends BaseIdsModel {
  final ProductModel? productModel;

  ProductDataModel(
      {required this.productModel,
        required String collectionId,
        required String databaseId,
        required DateTime createdAt,
        required DateTime updatedAt})
      : super(
      collectionId: collectionId,
      databaseId: databaseId,
      createdAt: createdAt,
      updatedAt: updatedAt);
}

class ProductModel {
  final String productId;
  final String restaurantId;
  final String name;
  final String description;
  final List<String> menu;
  final double price;
  final String image;

  ProductModel(
      {required this.productId,
        required this.restaurantId,
        required this.name,
        required this.description,
        required this.menu,
        required this.price,
        required this.image});
}