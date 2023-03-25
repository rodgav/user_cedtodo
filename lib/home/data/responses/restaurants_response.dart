import 'package:json_annotation/json_annotation.dart';
import 'package:user_cedtodo/home/data/responses/base_response.dart';

part 'restaurants_response.g.dart';

@JsonSerializable()
class RestaurantsResponse extends BaseTotalResponse {
  @JsonKey(name: 'documents')
  final List<RestaurantDataResponse>? restaurantsDataResponse;

  RestaurantsResponse({this.restaurantsDataResponse, int? total})
      : super(total: total);

  factory RestaurantsResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantsResponseToJson(this);
}

@JsonSerializable()
class RestaurantDataResponse extends BaseIdsResponse {
  @JsonKey(name: 'data')
  final RestaurantResponse? restaurantResponse;

  RestaurantDataResponse(
      {this.restaurantResponse,
      String? collectionId,
      String? databaseId,
      DateTime? createdAt,
      DateTime? updatedAt})
      : super(
            collectionId: collectionId,
            databaseId: databaseId,
            createdAt: createdAt,
            updatedAt: updatedAt);

  factory RestaurantDataResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantDataResponseToJson(this);
}

@JsonSerializable()
class RestaurantResponse {
  @JsonKey(name: '\u0024id', defaultValue: '')
  final String? restaurantId;
  @JsonKey(name: 'userId')
  final String? userId;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'phone')
  final String? phone;
  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'latitude')
  final double? latitude;
  @JsonKey(name: 'longitude')
  final double? longitude;
  @JsonKey(name: 'category')
  final String? category;
  @JsonKey(name: 'menu')
  final List<String>? menu;
  @JsonKey(name: 'image')
  final String? image;

  RestaurantResponse(
      this.restaurantId,
      this.userId,
      this.name,
      this.email,
      this.phone,
      this.address,
      this.latitude,
      this.longitude,
      this.category,
      this.menu,
      this.image);

  factory RestaurantResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantResponseToJson(this);
}
