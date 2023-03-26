import 'package:flutter/material.dart';
import 'package:user_cedtodo/home/domain/model/categories_model.dart';
import 'package:user_cedtodo/home/presentation/home/pages/restaurants/categories_result.dart';
import 'package:user_cedtodo/home/presentation/home/pages/restaurants/restaurants_result.dart';
import 'package:user_cedtodo/home/presentation/home/pages/restaurants/restaurants_viewmodel.dart';
import 'package:user_cedtodo/home/presentation/home/pages/restaurants/widgets/categories_shimmer.dart';
import 'package:user_cedtodo/home/presentation/home/pages/restaurants/widgets/item_category.dart';
import 'package:user_cedtodo/home/presentation/home/pages/restaurants/widgets/item_restaurant.dart';
import 'package:user_cedtodo/home/presentation/home/pages/restaurants/widgets/restaurants_shimmer.dart';
import 'package:user_cedtodo/main.dart';
import 'package:user_cedtodo/startapp/presentation/results/generic_data_state.dart';

class RestaurantsView extends StatefulWidget {
  const RestaurantsView({Key? key}) : super(key: key);

  @override
  State<RestaurantsView> createState() => _RestaurantsViewState();
}

class _RestaurantsViewState extends State<RestaurantsView> {
  final _restaurantsViewModel = getIt<RestaurantsViewModel>();
  final TextEditingController _searchTextEditCtrl = TextEditingController();

  _bind() async {
    _restaurantsViewModel.start();
    await _restaurantsViewModel.getRestaurants();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _restaurantsViewModel.finish();
    _searchTextEditCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _searchTextEditCtrl,
                decoration: InputDecoration(
                    label: const Text('Buscar restaurantes'),
                    hintText: 'Nombre del restaurante',
                    suffixIcon: Ink(
                      child: InkWell(
                        customBorder: const CircleBorder(),
                        child: const Icon(Icons.search),
                        onTap: () {
                          final searchText = _searchTextEditCtrl.text.trim();
                          _restaurantsViewModel.setSearchRestaurants(
                              name: searchText,
                              nameNull: searchText.isEmpty ? true : false);
                        },
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                onFieldSubmitted: (value) {
                  final searchText = _searchTextEditCtrl.text.trim();

                  _restaurantsViewModel.setSearchRestaurants(
                      name: value, nameNull: searchText.isEmpty ? true : false);
                },
              ),
            ),
            const SizedBox(height: 20),
            StreamBuilder<CategoriesResult?>(
                stream: _restaurantsViewModel.categoriesResultOutput,
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    final categoriesResult = snapshot.data;
                    if (categoriesResult is CategoriesSuccess) {
                      final categoriesModel =
                          categoriesResult.categoriesModel?.categoriesDataModel;
                      return categoriesModel != null &&
                              categoriesModel.isNotEmpty
                          ? SizedBox(
                              height: 50,
                              width: size.width,
                              child: ListView.separated(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (_, index) {
                                    final categoryData = categoriesModel[index];
                                    return ItemCategory(
                                      categoryData,
                                      categoryDataSel:
                                          categoriesResult.categoryDataModel,
                                      callBackCategory: () {
                                        _restaurantsViewModel
                                            .setCategory(categoryData);
                                        _restaurantsViewModel
                                            .setSearchRestaurants(
                                                category: categoryData
                                                    .categoryModel.name);
                                      },
                                    );
                                  },
                                  separatorBuilder: (_, index) =>
                                      const SizedBox(width: 10),
                                  itemCount: categoriesModel.length),
                            )
                          : const SizedBox();
                    }
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Ocurrio un error'));
                  }
                  return const CategoriesShimmer();
                }),
            const SizedBox(height: 20),
            Expanded(
              child: StreamBuilder<RestaurantsResult?>(
                  stream: _restaurantsViewModel.restaurantsResultOutput,
                  builder: (_, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      final restaurantsResult = snapshot.data;
                      if (restaurantsResult is RestaurantsSuccess) {
                        final restaurantsDataModel = restaurantsResult
                            .restaurantsModel?.restaurantsDataModel;
                        return restaurantsDataModel != null &&
                                restaurantsDataModel.isNotEmpty
                            ? ListView.separated(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (_, index) {
                                  if (restaurantsResult.genericDataState ==
                                          GenericDataSate.loadingData &&
                                      index == restaurantsDataModel.length) {
                                    return const SizedBox(
                                      width: 48,
                                      height: 48,
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if (restaurantsResult
                                              .genericDataState ==
                                          GenericDataSate.noData &&
                                      index == restaurantsDataModel.length) {
                                    return const Center(
                                        child: Text('No hay mas datos'));
                                  } else if (restaurantsResult
                                              .genericDataState ==
                                          GenericDataSate.data &&
                                      index == restaurantsDataModel.length) {
                                    return const SizedBox();
                                  } else {
                                    final restaurantDataModel =
                                        restaurantsDataModel[index];
                                    return ItemRestaurant(restaurantDataModel);
                                  }
                                },
                                separatorBuilder: (_, index) =>
                                    const SizedBox(height: 10),
                                itemCount: restaurantsDataModel.length + 1,
                              )
                            : const Center(child: Text('Ocurrio un error'));
                      } else {
                        return const Center(child: Text('Ocurrio un error'));
                      }
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('Ocurrio un error'));
                    }
                    return const RestaurantsShimmer();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
