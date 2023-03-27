import 'package:user_cedtodo/home/data/mapper/categories_mapper.dart';
import 'package:user_cedtodo/home/data/responses/products_response.dart';
import 'package:user_cedtodo/home/domain/model/products_model.dart';

extension ProductsResponseMapper on ProductsResponse? {
  ProductsModel toDomain() {
    final productsDataModel =
        (this?.productsDataResponse?.map((e) => e.toDomain()) ?? iterableEmpty)
            .cast<ProductDataModel>()
            .toList();
    return ProductsModel(
        productsDataModel: productsDataModel, total: this?.total ?? zeroInt);
  }
}

extension ProductDataResponseMapper on ProductDataResponse? {
  ProductDataModel toDomain() {
    return ProductDataModel(
        productModel: this?.productResponse?.toDomain() ??
            ProductModel(
                productId: empty,
                restaurantId: empty,
                name: empty,
                description: empty,
                menu: empty,
                price: zeroDouble,
                image: empty),
        collectionId: this?.collectionId ?? empty,
        databaseId: this?.databaseId ?? empty,
        createdAt: this?.createdAt ?? dateTime,
        updatedAt: this?.updatedAt ?? dateTime);
  }
}

extension ProductResponseMapper on ProductResponse? {
  ProductModel toDomain() {
    return ProductModel(
        productId: this?.productId ?? empty,
        restaurantId: this?.restaurantId ?? empty,
        name: this?.name ?? empty,
        description: this?.description ?? empty,
        menu: this?.menu ?? empty,
        price: this?.price ?? zeroDouble,
        image: this?.image ?? empty);
  }
}
