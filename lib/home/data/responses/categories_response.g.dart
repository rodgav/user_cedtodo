// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesResponse _$CategoriesResponseFromJson(Map<String, dynamic> json) =>
    CategoriesResponse(
      categoriesDataResponse: (json['documents'] as List<dynamic>?)
          ?.map((e) => CategoryDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int? ?? 0,
    );

Map<String, dynamic> _$CategoriesResponseToJson(CategoriesResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'documents': instance.categoriesDataResponse,
    };

CategoryDataResponse _$CategoryDataResponseFromJson(
        Map<String, dynamic> json) =>
    CategoryDataResponse(
      categoryResponse: json['data'] == null
          ? null
          : CategoryResponse.fromJson(json['data'] as Map<String, dynamic>),
      collectionId: json[r'$collectionId'] as String? ?? '',
      databaseId: json[r'$databaseId'] as String? ?? '',
      createdAt: json[r'$createdAt'] == null
          ? null
          : DateTime.parse(json[r'$createdAt'] as String),
      updatedAt: json[r'$updatedAt'] == null
          ? null
          : DateTime.parse(json[r'$updatedAt'] as String),
    );

Map<String, dynamic> _$CategoryDataResponseToJson(
        CategoryDataResponse instance) =>
    <String, dynamic>{
      r'$collectionId': instance.collectionId,
      r'$databaseId': instance.databaseId,
      r'$createdAt': instance.createdAt?.toIso8601String(),
      r'$updatedAt': instance.updatedAt?.toIso8601String(),
      'data': instance.categoryResponse,
    };

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) =>
    CategoryResponse(
      categoryId: json[r'$id'] as String? ?? '',
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CategoryResponseToJson(CategoryResponse instance) =>
    <String, dynamic>{
      r'$id': instance.categoryId,
      'name': instance.name,
    };
