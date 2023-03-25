import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseIdsResponse {
  @JsonKey(name: '\u0024collectionId', defaultValue: '')
  final String? collectionId;
  @JsonKey(name: '\u0024databaseId', defaultValue: '')
  final String? databaseId;
  @JsonKey(name: '\u0024createdAt')
  final DateTime? createdAt;
  @JsonKey(name: '\u0024updatedAt')
  final DateTime? updatedAt;

  BaseIdsResponse(
      {required this.collectionId,
      required this.databaseId,
      required this.createdAt,
      required this.updatedAt});
}

@JsonSerializable()
class BaseTotalResponse {
  @JsonKey(name: 'total', defaultValue: 0)
  final int? total;

  BaseTotalResponse({required this.total});
}
