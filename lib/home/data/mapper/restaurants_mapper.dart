import 'package:user_cedtodo/home/data/mapper/categories_mapper.dart';
import 'package:user_cedtodo/home/data/responses/restaurants_response.dart';
import 'package:user_cedtodo/home/domain/model/restaurants_model.dart';

extension RestaurantsResponseMapper on RestaurantsResponse? {
  RestaurantsModel toDomain() {
    List<RestaurantDataModel> restaurantsModel =
        (this?.restaurantsDataResponse?.map((e) => e.toDomain()) ??
                iterableEmpty)
            .cast<RestaurantDataModel>()
            .toList();

    return RestaurantsModel(
        restaurantsDataModel: restaurantsModel, total: this?.total ?? zeroInt);
  }
}

extension RestaurantDataResponseMapper on RestaurantDataResponse? {
  RestaurantDataModel toDomain() {
    return RestaurantDataModel(
        restaurantModel: this?.restaurantResponse.toDomain() ??
            RestaurantModel(
                restaurantId: empty,
                userId: empty,
                name: empty,
                email: empty,
                phone: empty,
                address: empty,
                latitude: zeroDouble,
                longitude: zeroDouble,
                category: empty,
                menu: iterableEmpty.cast<String>().toList(),
                image: empty),
        collectionId: this?.collectionId ?? empty,
        databaseId: this?.databaseId ?? empty,
        createdAt: dateTime,
        updatedAt: dateTime);
  }
}

extension RestaurantResponseMapper on RestaurantResponse? {
  RestaurantModel toDomain() {
    return RestaurantModel(
        restaurantId: this?.restaurantId ?? empty,
        userId: this?.userId ?? empty,
        name: this?.name ?? empty,
        email: this?.email ?? empty,
        phone: this?.phone ?? empty,
        address: this?.address ?? empty,
        latitude: this?.latitude ?? zeroDouble,
        longitude: this?.longitude ?? zeroDouble,
        category: this?.category ?? empty,
        menu: this?.menu ?? iterableEmpty.cast<String>().toList(),
        image: this?.image ?? empty);
  }
}
