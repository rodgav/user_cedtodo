import 'package:hive_flutter/hive_flutter.dart';
import 'package:user_cedtodo/home/data/mapper/categories_mapper.dart';
import 'package:user_cedtodo/home/domain/model/products_model.dart';
import 'package:user_cedtodo/startapp/application/constants.dart';

part 'cart_adapter.g.dart';

@HiveType(typeId: Constants.cartAdapterTypeId)
class CartAdapter extends HiveObject {
  @HiveField(0)
  final List<ProductModel> productsModel;
  @HiveField(1)
  final DateTime dateTime;

  CartAdapter({required this.productsModel, required this.dateTime});
}

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  ProductModel read(BinaryReader reader) {
    final map = reader.readMap();
    return ProductModel(
        productId: map['productId'].toString(),
        restaurantId: map['restaurantId'].toString(),
        name: map['name'].toString(),
        description: map['description'].toString(),
        menu: map['menu'] ?? <String>[],
        price: map['price'] ?? zeroDouble,
        image: map['image'].toString());
  }

  @override
  int get typeId => Constants.productModelTypeId;

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer.writeMap({
      'productId': obj.productId,
      'restaurantId': obj.restaurantId,
      'name': obj.name,
      'description': obj.description,
      'menu': obj.menu,
      'price': obj.price,
      'image': obj.image
    });
  }
}
