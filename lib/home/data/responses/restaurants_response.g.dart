// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurants_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantsResponse _$RestaurantsResponseFromJson(Map<String, dynamic> json) =>
    RestaurantsResponse(
      restaurantsDataResponse: (json['documents'] as List<dynamic>?)
          ?.map(
              (e) => RestaurantDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int? ?? 0,
    );

Map<String, dynamic> _$RestaurantsResponseToJson(
        RestaurantsResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'documents': instance.restaurantsDataResponse,
    };

RestaurantDataResponse _$RestaurantDataResponseFromJson(
        Map<String, dynamic> json) =>
    RestaurantDataResponse(
      restaurantResponse: json['data'] == null
          ? null
          : RestaurantResponse.fromJson(json['data'] as Map<String, dynamic>),
      collectionId: json[r'$collectionId'] as String? ?? '',
      databaseId: json[r'$databaseId'] as String? ?? '',
      createdAt: json[r'$createdAt'] == null
          ? null
          : DateTime.parse(json[r'$createdAt'] as String),
      updatedAt: json[r'$updatedAt'] == null
          ? null
          : DateTime.parse(json[r'$updatedAt'] as String),
    );

Map<String, dynamic> _$RestaurantDataResponseToJson(
        RestaurantDataResponse instance) =>
    <String, dynamic>{
      r'$collectionId': instance.collectionId,
      r'$databaseId': instance.databaseId,
      r'$createdAt': instance.createdAt?.toIso8601String(),
      r'$updatedAt': instance.updatedAt?.toIso8601String(),
      'data': instance.restaurantResponse,
    };

RestaurantResponse _$RestaurantResponseFromJson(Map<String, dynamic> json) =>
    RestaurantResponse(
      json[r'$id'] as String? ?? '',
      json['userId'] as String?,
      json['name'] as String?,
      json['email'] as String?,
      json['phone'] as String?,
      json['address'] as String?,
      (json['latitude'] as num?)?.toDouble(),
      (json['longitude'] as num?)?.toDouble(),
      json['category'] as String?,
      (json['menu'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['image'] as String?,
    );

Map<String, dynamic> _$RestaurantResponseToJson(RestaurantResponse instance) =>
    <String, dynamic>{
      r'$id': instance.restaurantId,
      'userId': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'category': instance.category,
      'menu': instance.menu,
      'image': instance.image,
    };
