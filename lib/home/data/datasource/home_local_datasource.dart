import 'package:user_cedtodo/home/data/service/home_hive_service.dart';
import 'package:user_cedtodo/home/domain/model/products_model.dart';

abstract class HomeLocalDataSource {
  Future<List<ProductModel>?> getCart();

  Future<ProductModel?> putCart(ProductModel productModel);

  Future<bool> clear();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final HomeHiveService _homeHiveService;

  HomeLocalDataSourceImpl(this._homeHiveService);

  @override
  Future<List<ProductModel>?> getCart() => _homeHiveService.getCart();

  @override
  Future<ProductModel?> putCart(ProductModel productModel) =>
      _homeHiveService.putCart(productModel);

  @override
  Future<bool> clear() => _homeHiveService.clear();
}
