// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseIdsResponse _$BaseIdsResponseFromJson(Map<String, dynamic> json) =>
    BaseIdsResponse(
      collectionId: json[r'$collectionId'] as String? ?? '',
      databaseId: json[r'$databaseId'] as String? ?? '',
      createdAt: json[r'$createdAt'] == null
          ? null
          : DateTime.parse(json[r'$createdAt'] as String),
      updatedAt: json[r'$updatedAt'] == null
          ? null
          : DateTime.parse(json[r'$updatedAt'] as String),
    );

Map<String, dynamic> _$BaseIdsResponseToJson(BaseIdsResponse instance) =>
    <String, dynamic>{
      r'$collectionId': instance.collectionId,
      r'$databaseId': instance.databaseId,
      r'$createdAt': instance.createdAt?.toIso8601String(),
      r'$updatedAt': instance.updatedAt?.toIso8601String(),
    };

BaseTotalResponse _$BaseTotalResponseFromJson(Map<String, dynamic> json) =>
    BaseTotalResponse(
      total: json['total'] as int? ?? 0,
    );

Map<String, dynamic> _$BaseTotalResponseToJson(BaseTotalResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
    };
