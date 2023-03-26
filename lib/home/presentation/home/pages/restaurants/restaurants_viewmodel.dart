import 'package:appwrite/appwrite.dart';
import 'package:rxdart/rxdart.dart';
import 'package:user_cedtodo/home/domain/model/categories_model.dart';
import 'package:user_cedtodo/home/domain/model/restaurants_model.dart';
import 'package:user_cedtodo/home/domain/usecases/get_categories_usecase.dart';
import 'package:user_cedtodo/home/domain/usecases/get_restaurants_usecase.dart';
import 'package:user_cedtodo/home/presentation/home/pages/restaurants/categories_result.dart';
import 'package:user_cedtodo/home/presentation/home/pages/restaurants/restaurants_result.dart';
import 'package:user_cedtodo/startapp/presentation/base/base_viewmodel.dart';
import 'package:user_cedtodo/startapp/presentation/results/generic_data_state.dart';

class RestaurantsViewModel extends BaseViewModel
    with RestaurantsViewModelInput, RestaurantsViewModelOutput {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetRestaurantsUseCase _getRestaurantsUseCase;

  RestaurantsViewModel(this._getCategoriesUseCase, this._getRestaurantsUseCase);

  BehaviorSubject<CategoriesResult?> _categoriesStreCtrl =
      BehaviorSubject<CategoriesResult?>();
  BehaviorSubject<RestaurantsResult?> _restaurantsStreCtrl =
      BehaviorSubject<RestaurantsResult?>.seeded(null);

  SearchRestaurants _searchRestaurants =
      SearchRestaurants(name: null, category: null);

  @override
  start() {
    if (_categoriesStreCtrl.isClosed) {
      _categoriesStreCtrl = BehaviorSubject<CategoriesResult?>();
    }
    if (_restaurantsStreCtrl.isClosed) {
      _restaurantsStreCtrl = BehaviorSubject<RestaurantsResult?>.seeded(null);
    }
    _getCategories();
    return super.start();
  }

  @override
  finish() {
    _categoriesStreCtrl.close();
    _restaurantsStreCtrl.close();
    return super.finish();
  }

  @override
  Sink<CategoriesResult?> get categoriesResultInput => _categoriesStreCtrl.sink;

  @override
  Sink<RestaurantsResult?> get restaurantsResultInput =>
      _restaurantsStreCtrl.sink;

  @override
  Stream<CategoriesResult?> get categoriesResultOutput =>
      _categoriesStreCtrl.stream.map((categories) => categories);

  @override
  Stream<RestaurantsResult?> get restaurantsResultOutput =>
      _restaurantsStreCtrl.stream.map((restaurants) => restaurants);

  @override
  getRestaurants() async {
    List<String> queries = List<String>.empty(growable: true);
    _searchRestaurants.name != null
        ? queries.add(Query.search('name', _searchRestaurants.name!))
        : null;
    _searchRestaurants.category != null
        ? queries.add(Query.search('category', _searchRestaurants.category!))
        : null;
    queries.add(Query.limit(20));
    int offset = 0;
    int totalRestaurants = 0;
    if (!(await restaurantsResultOutput.isEmpty)) {
      final restaurantsResult = await restaurantsResultOutput.first;
      if (restaurantsResult is RestaurantsSuccess) {
        final restaurantsModel = restaurantsResult.restaurantsModel;
        restaurantsResultInput.add(RestaurantsSuccess(
            restaurantsModel: restaurantsModel,
            genericDataState: GenericDataSate.loadingData));
        offset = restaurantsModel?.restaurantsDataModel.length ?? 0;
        totalRestaurants = restaurantsModel?.total ?? 0;
        queries.add(Query.offset(offset));
        if (offset <= totalRestaurants) {
          _getRestaurants(queries, restaurantsModel: restaurantsModel);
        } else {
          restaurantsResultInput.add(RestaurantsSuccess(
              restaurantsModel: restaurantsModel,
              genericDataState: GenericDataSate.noData));
        }
      } else {
        _getRestaurants(queries);
      }
    }
  }

  @override
  setSearchRestaurants(
      {String? name,
      String? category,
      bool nameNull = false,
      bool categoryNull = false}) {
    restaurantsResultInput.add(null);
    nameNull ? _searchRestaurants.name = null : null;
    categoryNull ? _searchRestaurants.category = null : null;
    _searchRestaurants = _searchRestaurants.copyWith(
        name: nameNull ? null : name, category: categoryNull ? null : category);
    getRestaurants();
  }

  @override
  setCategory(CategoryDataModel? categoryDataModel) async {
    final categoriesResult = await categoriesResultOutput.first;
    if (categoriesResult is CategoriesSuccess) {
      categoriesResultInput.add(CategoriesSuccess(
          categoriesModel: categoriesResult.categoriesModel,
          genericDataSate: GenericDataSate.data,
          categoryDataModel: categoryDataModel));
    }
  }

  _getRestaurants(List<String> queries,
      {RestaurantsModel? restaurantsModel}) async {
    restaurantsResultInput.add(RestaurantsSuccess(
        restaurantsModel: restaurantsModel,
        genericDataState: GenericDataSate.error));
    (await _getRestaurantsUseCase.execute(queries)).fold(
        (l) => restaurantsResultInput.add(RestaurantsSuccess(
            restaurantsModel: restaurantsModel,
            genericDataState: GenericDataSate.error)), (r) {
      final restaurantsDataModel = r.restaurantsDataModel;
      restaurantsResultInput.add(RestaurantsSuccess(
          restaurantsModel: RestaurantsModel(
              restaurantsDataModel: restaurantsModel != null
                  ? [
                      ...restaurantsModel.restaurantsDataModel,
                      ...restaurantsDataModel
                    ]
                  : restaurantsDataModel,
              total: r.total),
          genericDataState: GenericDataSate.data));
    });
  }

  _getCategories() async {
    (await _getCategoriesUseCase.execute(null)).fold(
        (l) => categoriesResultInput.add(CategoriesSuccess(
            categoriesModel: null,
            genericDataSate: GenericDataSate.error,
            categoryDataModel: null)),
        (r) => categoriesResultInput.add(CategoriesSuccess(
            categoriesModel: r,
            genericDataSate: GenericDataSate.data,
            categoryDataModel: null)));
  }
}

abstract class RestaurantsViewModelInput {
  Sink<CategoriesResult?> get categoriesResultInput;

  Sink<RestaurantsResult?> get restaurantsResultInput;

  getRestaurants();

  setSearchRestaurants({String? name, String? category});

  setCategory(CategoryDataModel? categoryDataModel);
}

abstract class RestaurantsViewModelOutput {
  Stream<CategoriesResult?> get categoriesResultOutput;

  Stream<RestaurantsResult?> get restaurantsResultOutput;
}

class SearchRestaurants {
  String? name;
  String? category;

  SearchRestaurants({this.name, this.category});

  SearchRestaurants copyWith({String? name, String? category}) {
    return SearchRestaurants(
        name: name ?? this.name, category: category ?? this.category);
  }
}
