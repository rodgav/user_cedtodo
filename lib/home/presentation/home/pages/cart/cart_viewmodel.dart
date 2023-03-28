import 'package:rxdart/rxdart.dart';
import 'package:user_cedtodo/home/domain/model/products_model.dart';
import 'package:user_cedtodo/home/domain/usecases/clear_cart_usecase.dart';
import 'package:user_cedtodo/home/domain/usecases/get_cart_usecase.dart';
import 'package:user_cedtodo/home/domain/usecases/put_cart_usecase.dart';
import 'package:user_cedtodo/home/presentation/home/pages/cart/cart_result.dart';
import 'package:user_cedtodo/startapp/presentation/base/base_viewmodel.dart';
import 'package:user_cedtodo/startapp/presentation/results/generic_data_state.dart';

class CartViewModel extends BaseViewModel
    with CartViewModelInput, CartViewModelOutput {
  final GetCartUseCase _getCartUseCase;
  final PutCartUseCase _putCartUseCase;
  final ClearCartUseCase _clearCartUseCase;

  CartViewModel(
      this._getCartUseCase, this._putCartUseCase, this._clearCartUseCase);

  BehaviorSubject<CartResult?> _cartResultStreCtrl =
      BehaviorSubject<CartResult?>.seeded(null);

  @override
  start() {
    if (_cartResultStreCtrl.isClosed) {
      _cartResultStreCtrl = BehaviorSubject<CartResult?>.seeded(null);
    }
    _getCart();
    super.start();
  }

  @override
  finish() {
    _cartResultStreCtrl.close();
    super.finish();
  }

  @override
  Sink<CartResult?> get cartResultInput => _cartResultStreCtrl.sink;

  @override
  Stream<CartResult?> get cartResultOutput =>
      _cartResultStreCtrl.stream.map((products) => products);

  @override
  addProductCart(ProductModel productModel) async {
    productModel.quantity += 1;
    _updateProductCart(productModel);
  }

  @override
  removeProductCart(ProductModel productModel) async {
    if (!(productModel.quantity <= 0)) {
      productModel.quantity -= 1;
      _updateProductCart(productModel);
    }
  }

  @override
  clearCart() async {
    (await _clearCartUseCase.execute(null))
        .fold((l) => setToastMessage(l.message), (r) => null);
  }

  _updateProductCart(ProductModel productModel) async {
    (await _putCartUseCase.execute(productModel))
        .fold((l) => setToastMessage(l.message), (r) async {
      final cartResult = await cartResultOutput.first;
      if (cartResult is CartSuccess) {
        final productsModel = cartResult.productsModel;
        if (productsModel != null) {
          final index = productsModel.indexWhere(
              (element) => element.productId == productModel.productId);
          if (index != -1) {
            productsModel[index].quantity = productModel.quantity;
            cartResultInput.add(cartResult);
          }
        }
      }
      _getCart();
    });
  }

  _getCart() async {
    (await _getCartUseCase.execute(null)).fold(
        (l) => cartResultInput.add(CartSuccess(null, GenericDataSate.error)),
        (r) => cartResultInput.add(CartSuccess(r, GenericDataSate.data)));
  }
}

abstract class CartViewModelInput {
  Sink<CartResult?> get cartResultInput;

  addProductCart(ProductModel productModel);

  removeProductCart(ProductModel productModel);

  clearCart();
}

abstract class CartViewModelOutput {
  Stream<CartResult?> get cartResultOutput;
}
