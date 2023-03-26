import 'package:json_annotation/json_annotation.dart';
import 'package:user_cedtodo/home/data/responses/base_response.dart';

part 'products_response.g.dart';

@JsonSerializable()
class ProductsResponse extends BaseTotalResponse {
  List<ProductDataResponse>? productsDataResponse;

  ProductsResponse({required this.productsDataResponse, required int total})
      : super(total: total);

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
}

@JsonSerializable()
class ProductDataResponse extends BaseIdsResponse {
  final ProductResponse? productResponse;

  ProductDataResponse(
      {required this.productResponse,
      required String collectionId,
      required String databaseId,
      required DateTime createdAt,
      required DateTime updatedAt})
      : super(
            collectionId: collectionId,
            databaseId: databaseId,
            createdAt: createdAt,
            updatedAt: updatedAt);

  factory ProductDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDataResponseToJson(this);
}

@JsonSerializable()
class ProductResponse {
  @JsonKey(name: '\u0024id', defaultValue: '')
  final String? productId;
  @JsonKey(name: 'restaurantId', defaultValue: '')
  final String? restaurantId;
  @JsonKey(name: 'name', defaultValue: '')
  final String? name;
  @JsonKey(name: 'description', defaultValue: '')
  final String? description;
  @JsonKey(name: 'menu')
  final List<String>? menu;
  @JsonKey(name: 'price')
  final double? price;
  @JsonKey(name: 'image', defaultValue: '')
  final String? image;

  ProductResponse(
      {required this.productId,
      required this.restaurantId,
      required this.name,
      required this.description,
      required this.menu,
      required this.price,
      required this.image});

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
