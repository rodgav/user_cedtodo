import 'package:appwrite/appwrite.dart';
import 'package:rxdart/rxdart.dart';
import 'package:user_cedtodo/home/domain/model/products_model.dart';
import 'package:user_cedtodo/home/domain/model/restaurants_model.dart';
import 'package:user_cedtodo/home/domain/usecases/get_cart_usecase.dart';
import 'package:user_cedtodo/home/domain/usecases/get_products_usecase.dart';
import 'package:user_cedtodo/home/domain/usecases/get_restaurant_usecase.dart';
import 'package:user_cedtodo/home/domain/usecases/put_cart_usecase.dart';
import 'package:user_cedtodo/home/presentation/home/pages/restaurant/products_result.dart';
import 'package:user_cedtodo/home/presentation/home/pages/restaurant/restaurant_result.dart';
import 'package:user_cedtodo/startapp/presentation/base/base_viewmodel.dart';
import 'package:user_cedtodo/startapp/presentation/results/generic_data_state.dart';
import 'package:user_cedtodo/startapp/util/generic_search.dart';

class RestaurantViewModel extends BaseViewModel
    with RestaurantViewModelInput, RestaurantViewModelOutput {
  final GetRestaurantUseCase _getRestaurantUseCase;
  final GetProductsUseCase _getProductsUseCase;
  final GetCartUseCase _getCartUseCase;
  final PutCartUseCase _putCartUseCase;

  RestaurantViewModel(this._getRestaurantUseCase, this._getProductsUseCase,
      this._getCartUseCase, this._putCartUseCase);

  BehaviorSubject<RestaurantResult?> _restaurantResultStreCtrl =
      BehaviorSubject<RestaurantResult?>();

  BehaviorSubject<ProductsResult?> _productsResultStreCtrl =
      BehaviorSubject<ProductsResult?>.seeded(null);
  BehaviorSubject<List<ProductModel>?> _cartProducts =
      BehaviorSubject<List<ProductModel>?>.seeded(null);
  GenericSearch _genericSearch = GenericSearch(name: null, field: null);

  @override
  start() {
    if (_restaurantResultStreCtrl.isClosed) {
      _restaurantResultStreCtrl = BehaviorSubject<RestaurantResult?>();
    }
    if (_productsResultStreCtrl.isClosed) {
      _productsResultStreCtrl = BehaviorSubject<ProductsResult?>.seeded(null);
    }
    if (_cartProducts.isClosed) {
      _cartProducts = BehaviorSubject<List<ProductModel>?>.seeded(null);
    }
    _genericSearch = GenericSearch(name: null, field: null);
    return super.start();
  }

  @override
  finish() {
    _restaurantResultStreCtrl.close();
    _productsResultStreCtrl.close();
    _cartProducts.close();
    _genericSearch = GenericSearch(name: null, field: null);
    return super.finish();
  }

  @override
  Sink<RestaurantResult?> get restaurantResultInput =>
      _restaurantResultStreCtrl.sink;

  @override
  Sink<ProductsResult?> get productsResultInput => _productsResultStreCtrl.sink;

  @override
  Sink<List<ProductModel>?> get cartProductsInput => _cartProducts.sink;

  @override
  Stream<RestaurantResult?> get restaurantResultOutput =>
      _restaurantResultStreCtrl.stream
          .map((restaurantResult) => restaurantResult);

  @override
  Stream<ProductsResult?> get productsResultOutput =>
      _productsResultStreCtrl.stream.map((productsResult) => productsResult);

  @override
  Stream<List<ProductModel>?> get cartProductsOutput =>
      _cartProducts.stream.map((cartProducts) => cartProducts);

  @override
  getRestaurant(
      String restaurantId, RestaurantDataModel? restaurantDataModel) async {
    if (restaurantDataModel != null) {
      restaurantResultInput.add(RestaurantSuccess(
          restaurantDataModel: restaurantDataModel,
          genericDataSate: GenericDataSate.data,
          menu: null));
    } else {
      (await _getRestaurantUseCase.execute(restaurantId)).fold(
          (l) => restaurantResultInput.add(RestaurantSuccess(
              restaurantDataModel: restaurantDataModel,
              genericDataSate: GenericDataSate.error,
              menu: null)),
          (r) => restaurantResultInput.add(RestaurantSuccess(
              restaurantDataModel: r,
              genericDataSate: GenericDataSate.data,
              menu: null)));
    }
  }

  @override
  getProducts(String restaurantId) async {
    List<String> queries = List<String>.empty(growable: true);
    queries.add(Query.search('restaurantId', restaurantId));
    _genericSearch.name != null
        ? queries.add(Query.search('name', _genericSearch.name!))
        : null;
    _genericSearch.field != null
        ? queries.add(Query.search('menu', '"${_genericSearch.field!}"'))
        : null;
    queries.add(Query.limit(20));
    int offset = 0;
    int totalProducts = 0;
    if (!(await productsResultOutput.isEmpty)) {
      final productsResult = await productsResultOutput.first;
      if (productsResult is ProductsSuccess) {
        final productsModel = productsResult.productsModel;
        productsResultInput.add(ProductsSuccess(
            productsModel: productsModel,
            genericDataState: GenericDataSate.loadingData));
        offset = productsModel?.productsDataModel.length ?? 0;
        totalProducts = productsModel?.total ?? 0;
        queries.add(Query.offset(offset));
        if (offset <= totalProducts) {
          _getProducts(queries, productsModel: productsModel);
        } else {
          productsResultInput.add(ProductsSuccess(
              productsModel: productsModel,
              genericDataState: GenericDataSate.noData));
        }
      } else {
        _getProducts(queries);
      }
    }
  }

  @override
  setSearchProducts(String restaurantId,
      {String? name,
      String? field,
      bool nameNull = false,
      bool fieldNull = false}) {
    productsResultInput.add(null);
    nameNull ? _genericSearch.name = null : null;
    fieldNull ? _genericSearch.field = null : null;
    _genericSearch = _genericSearch.copyWith(
        name: nameNull ? null : name, field: fieldNull ? null : field);
    getProducts(restaurantId);
  }

  @override
  setMenu(String? menu) async {
    final restaurantResult = await restaurantResultOutput.first;
    if (restaurantResult is RestaurantSuccess) {
      restaurantResultInput.add(RestaurantSuccess(
          restaurantDataModel: restaurantResult.restaurantDataModel,
          genericDataSate: GenericDataSate.data,
          menu: menu));
    }
  }

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

  _getProducts(List<String> queries, {ProductsModel? productsModel}) async {
    productsResultInput.add(null);
    (await _getProductsUseCase.execute(queries)).fold((l) {
      productsResultInput.add(ProductsSuccess(
          productsModel: productsModel,
          genericDataState: GenericDataSate.error));
    }, (r) {
      final productsDataModel = r.productsDataModel;
      productsResultInput.add(ProductsSuccess(
          productsModel: ProductsModel(
              productsDataModel: productsModel != null
                  ? [...productsModel.productsDataModel, ...productsDataModel]
                  : productsDataModel,
              total: r.total),
          genericDataState: GenericDataSate.data));
    });
  }

  _updateProductCart(ProductModel productModel) async {
    (await _putCartUseCase.execute(productModel))
        .fold((l) => setToastMessage(l.message), (r) async {
      final productResult = await productsResultOutput.first;
      if (productResult is ProductsSuccess) {
        final productsDataModel =
            productResult.productsModel?.productsDataModel;
        if (productsDataModel != null) {
          final index = productsDataModel.indexWhere((element) =>
              element.productModel.productId == productModel.productId);
          if (index != -1) {
            productsDataModel[index].productModel.quantity =
                productModel.quantity;
            productsResultInput.add(productResult);
          }
        }
      }
      getCart();
    });
  }

  getCart() async {
    (await _getCartUseCase.execute(null)).fold(
        (l) => cartProductsInput.add(null), (r) => cartProductsInput.add(r));
  }
}

abstract class RestaurantViewModelInput {
  Sink<RestaurantResult?> get restaurantResultInput;

  Sink<ProductsResult?> get productsResultInput;

  Sink<List<ProductModel>?> get cartProductsInput;

  getRestaurant(String restaurantId, RestaurantDataModel? restaurantDataModel);

  getProducts(String restaurantId);

  setSearchProducts(String restaurantId,
      {String? name,
      String? field,
      bool nameNull = false,
      bool fieldNull = false});

  setMenu(String? menu);

  addProductCart(ProductModel productModel);

  removeProductCart(ProductModel productModel);
}

abstract class RestaurantViewModelOutput {
  Stream<RestaurantResult?> get restaurantResultOutput;

  Stream<ProductsResult?> get productsResultOutput;

  Stream<List<ProductModel>?> get cartProductsOutput;
}
