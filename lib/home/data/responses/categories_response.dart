import 'package:json_annotation/json_annotation.dart';
import 'package:user_cedtodo/home/data/responses/base_response.dart';

part 'categories_response.g.dart';

@JsonSerializable()
class CategoriesResponse extends BaseTotalResponse {
  @JsonKey(name: 'documents')
  final List<CategoryDataResponse>? categoriesDataResponse;

  CategoriesResponse({this.categoriesDataResponse, int? total})
      : super(total: total);

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesResponseToJson(this);
}

@JsonSerializable()
class CategoryDataResponse extends BaseIdsResponse {
  @JsonKey(name: "data")
  final CategoryResponse? categoryResponse;

  CategoryDataResponse({
    this.categoryResponse,
    String? collectionId,
    String? databaseId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
            collectionId: collectionId,
            databaseId: databaseId,
            createdAt: createdAt,
            updatedAt: updatedAt);

  factory CategoryDataResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDataResponseToJson(this);
}

@JsonSerializable()
class CategoryResponse {
  @JsonKey(name: '\u0024id', defaultValue: '')
  final String? categoryId;
  @JsonKey(name: 'name')
  final String? name;

  CategoryResponse({this.categoryId, this.name});

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}
