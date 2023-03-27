import 'package:hive_flutter/hive_flutter.dart';
import 'package:user_cedtodo/home/data/local/adapters/cart_adapter.dart';
import 'package:user_cedtodo/home/domain/model/products_model.dart';
import 'package:user_cedtodo/startapp/application/constants.dart';

class HomeHiveService {
  final Box<CartAdapter> _cartBox;
  final int _expirationTimeInMinutes = 10;

  HomeHiveService(this._cartBox);

  Future<List<ProductModel>?> getCart() async {
    final cartAdapter = _cartBox.get(Constants.cartAdapter);

    if (cartAdapter != null) {
      final productsModel = cartAdapter.productsModel;
      final timeStamp = cartAdapter.dateTime;
      if (DateTime.now().difference(timeStamp) >
          Duration(minutes: _expirationTimeInMinutes)) {
        await _cartBox.clear();
        return null;
      }
      return productsModel;
    }
    return null;
  }

  Future<ProductModel?> putCart(ProductModel productModel) async {
    try {
      final listProductModel = await getCart();
      if (listProductModel != null) {
        final index = listProductModel.indexWhere(
            (element) => element.productId == productModel.productId);
        if (index != -1) {
          if (productModel.quantity <= 0) {
            listProductModel.removeAt(index);
            return await _putProductModel(listProductModel, productModel);
          } else {
            listProductModel[index].quantity = productModel.quantity;
            return await _putProductModel(listProductModel, productModel);
          }
        } else {
          return await _putProductModel(
              [...listProductModel, productModel], productModel);
        }
      } else {
        return await _putProductModel([productModel], productModel);
      }
    } catch (_) {
      return null;
    }
  }

  Future<ProductModel> _putProductModel(
      List<ProductModel> productsModel, ProductModel productModel) async {
    final dateTime = DateTime.now();
    final cartAdapter =
        CartAdapter(productsModel: productsModel, dateTime: dateTime);
    await _cartBox.clear();
    await _cartBox.put(Constants.cartAdapter, cartAdapter);
    return productModel;
  }
}
