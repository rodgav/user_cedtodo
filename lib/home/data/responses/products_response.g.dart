// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsResponse _$ProductsResponseFromJson(Map<String, dynamic> json) =>
    ProductsResponse(
      productsDataResponse: (json['documents'] as List<dynamic>?)
          ?.map((e) => ProductDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int? ?? 0,
    );

Map<String, dynamic> _$ProductsResponseToJson(ProductsResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'documents': instance.productsDataResponse,
    };

ProductDataResponse _$ProductDataResponseFromJson(Map<String, dynamic> json) =>
    ProductDataResponse(
      productResponse: json['data'] == null
          ? null
          : ProductResponse.fromJson(json['data'] as Map<String, dynamic>),
      collectionId: json[r'$collectionId'] as String? ?? '',
      databaseId: json[r'$databaseId'] as String? ?? '',
      createdAt: DateTime.parse(json[r'$createdAt'] as String),
      updatedAt: DateTime.parse(json[r'$updatedAt'] as String),
    );

Map<String, dynamic> _$ProductDataResponseToJson(
        ProductDataResponse instance) =>
    <String, dynamic>{
      r'$collectionId': instance.collectionId,
      r'$databaseId': instance.databaseId,
      r'$createdAt': instance.createdAt?.toIso8601String(),
      r'$updatedAt': instance.updatedAt?.toIso8601String(),
      'data': instance.productResponse,
    };

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      productId: json[r'$id'] as String? ?? '',
      restaurantId: json['restaurantId'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      menu: json['menu'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      image: json['image'] as String? ?? '',
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      r'$id': instance.productId,
      'restaurantId': instance.restaurantId,
      'name': instance.name,
      'description': instance.description,
      'menu': instance.menu,
      'price': instance.price,
      'image': instance.image,
    };
