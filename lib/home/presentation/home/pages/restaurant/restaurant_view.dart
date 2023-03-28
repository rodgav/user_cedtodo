import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_cedtodo/home/domain/model/products_model.dart';
import 'package:user_cedtodo/home/domain/model/restaurants_model.dart';
import 'package:user_cedtodo/home/presentation/home/pages/restaurant/products_result.dart';
import 'package:user_cedtodo/home/presentation/home/pages/restaurant/restaurant_result.dart';
import 'package:user_cedtodo/home/presentation/home/pages/restaurant/restaurant_viewmodel.dart';
import 'package:user_cedtodo/home/presentation/home/pages/restaurant/widgets/item_product.dart';
import 'package:user_cedtodo/home/presentation/home/pages/restaurant/widgets/restaurant_shimmer.dart';
import 'package:user_cedtodo/home/presentation/home/pages/restaurants/widgets/restaurants_shimmer.dart';
import 'package:user_cedtodo/main.dart';
import 'package:user_cedtodo/startapp/presentation/resources/dialogs/dialogs.dart';
import 'package:user_cedtodo/startapp/presentation/resources/routing/route.dart';
import 'package:user_cedtodo/startapp/presentation/resources/routing/routes.dart';
import 'package:user_cedtodo/startapp/presentation/results/generic_data_state.dart';

class RestaurantView extends StatefulWidget {
  final String? restaurantId;
  final RestaurantDataModel? restaurantDataModel;

  const RestaurantView(
      {required this.restaurantId, required this.restaurantDataModel, Key? key})
      : super(key: key);

  @override
  State<RestaurantView> createState() => _RestaurantViewState();
}

class _RestaurantViewState extends State<RestaurantView> {
  final _restaurantViewModel = getIt<RestaurantViewModel>();
  final _searchTextEditCtrl = TextEditingController();

  _bind() async {
    _restaurantViewModel.start();
    if (widget.restaurantId != null) {
      _restaurantViewModel.getRestaurant(
          widget.restaurantId!, widget.restaurantDataModel);
      _restaurantViewModel.getProducts(widget.restaurantId!);
    } else {
      showDialogMessage(context,
          title: 'Ocurrio un error',
          message: 'No se proporciono un restaurante',
          rightText: 'Cerrar',
          rightOnPressed: () => context.back());
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _restaurantViewModel.toastMessageOutput.listen((event) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(event),
          duration: const Duration(seconds: 2),
        ));
      });
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _restaurantViewModel.finish();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Ink(
          child: InkWell(
            customBorder: const CircleBorder(),
            child: const Icon(Icons.arrow_back_ios_new_outlined,
                color: Colors.black54),
            onTap: () {
              context.back();
            },
          ),
        ),
        title: SizedBox(
          height: 40,
          child: TextFormField(
            controller: _searchTextEditCtrl,
            decoration: InputDecoration(
              hintText: 'Buscar',
              border: const OutlineInputBorder(),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              suffixIcon: Ink(
                child: InkWell(
                  customBorder: const CircleBorder(),
                  child: const Icon(Icons.search),
                  onTap: () {
                    if (widget.restaurantId != null) {
                      final searchText = _searchTextEditCtrl.text.trim();
                      _restaurantViewModel.setSearchProducts(
                          widget.restaurantId!,
                          name: searchText,
                          nameNull: searchText.isEmpty ? true : false);
                    }
                  },
                ),
              ),
            ),
            onFieldSubmitted: (value) {
              if (widget.restaurantId != null) {
                final searchText = _searchTextEditCtrl.text.trim();
                _restaurantViewModel.setSearchProducts(widget.restaurantId!,
                    name: value, nameNull: searchText.isEmpty ? true : false);
              }
            },
          ),
        ),
      ),
      body: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: StreamBuilder<RestaurantResult?>(
            stream: _restaurantViewModel.restaurantResultOutput,
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                final restaurantResult = snapshot.data;
                if (restaurantResult is RestaurantSuccess) {
                  final restaurantModel =
                      restaurantResult.restaurantDataModel?.restaurantModel;
                  return restaurantModel != null
                      ? Column(
                          children: [
                            const SizedBox(height: 10),
                            Card(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: ExpansionTile(
                                    leading: SizedBox(
                                      width: 48,
                                      height: 48,
                                      child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          imageUrl:
                                              'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&w=1000&q=80',
                                          imageBuilder: (_, imageProvider) =>
                                              CircleAvatar(
                                                  backgroundImage:
                                                      imageProvider),
                                          errorWidget: (_, __, ___) =>
                                              const Icon(Icons.warning)),
                                    ),
                                    title: Text(restaurantModel.name),
                                    subtitle: Text(restaurantModel.category),
                                    children: ListTile.divideTiles(
                                        context: context,
                                        color: Colors.grey.shade200,
                                        tiles: [
                                          ListTile(
                                            title: const Text("Email"),
                                            subtitle:
                                                Text(restaurantModel.email),
                                            trailing: const Icon(Icons.email),
                                          ),
                                          ListTile(
                                            title: const Text("Phone"),
                                            subtitle:
                                                Text(restaurantModel.phone),
                                            trailing: const Icon(Icons.call),
                                          ),
                                          ListTile(
                                            title: const Text("Address"),
                                            subtitle:
                                                Text(restaurantModel.address),
                                            trailing:
                                                const Icon(Icons.location_on),
                                          ),
                                        ]).toList())),
                            SizedBox(
                                height: 50,
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    itemBuilder: (_, index) {
                                      final menu = restaurantModel.menu[index];
                                      return ChoiceChip(
                                        label: Text(menu),
                                        selected: restaurantResult.menu == menu,
                                        selectedColor: Colors.blue,
                                        onSelected: (val) {
                                          _restaurantViewModel.setMenu(menu);
                                          if (widget.restaurantId != null) {
                                            _restaurantViewModel
                                                .setSearchProducts(
                                                    widget.restaurantId!,
                                                    field: menu);
                                          }
                                        },
                                      );
                                    },
                                    separatorBuilder: (_, index) =>
                                        const SizedBox(width: 10),
                                    itemCount: restaurantModel.menu.length)),
                            Expanded(
                              child: StreamBuilder<ProductsResult?>(
                                  stream:
                                      _restaurantViewModel.productsResultOutput,
                                  builder: (_, snapshot) {
                                    if (snapshot.hasData) {
                                      final productsResult = snapshot.data;
                                      if (productsResult is ProductsSuccess) {
                                        final productsDataModel = productsResult
                                            .productsModel?.productsDataModel;
                                        return productsDataModel != null &&
                                                productsDataModel.isNotEmpty
                                            ? ListView.separated(
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                shrinkWrap: true,
                                                itemBuilder: (_, index) {
                                                  if (productsResult
                                                              .genericDataState ==
                                                          GenericDataSate
                                                              .loadingData &&
                                                      index ==
                                                          productsDataModel
                                                              .length) {
                                                    return const SizedBox(
                                                      width: 48,
                                                      height: 48,
                                                      child:
                                                          CircularProgressIndicator(),
                                                    );
                                                  } else if (productsResult
                                                              .genericDataState ==
                                                          GenericDataSate
                                                              .noData &&
                                                      index ==
                                                          productsDataModel
                                                              .length) {
                                                    return const Center(
                                                        child: Text(
                                                            'No hay mas datos'));
                                                  } else if (productsResult
                                                              .genericDataState ==
                                                          GenericDataSate
                                                              .data &&
                                                      index ==
                                                          productsDataModel
                                                              .length) {
                                                    return const SizedBox();
                                                  } else {
                                                    final productDataModel =
                                                        productsDataModel[
                                                            index];
                                                    return ItemProduct(
                                                        productDataModel,
                                                        _restaurantViewModel);
                                                  }
                                                },
                                                separatorBuilder: (_, index) =>
                                                    const SizedBox(height: 10),
                                                itemCount:
                                                    productsDataModel.length +
                                                        1,
                                              )
                                            : const Center(
                                                child:
                                                    Text('Ocurrio un error'));
                                      } else {
                                        return const Center(
                                            child: Text('Ocurrio un error'));
                                      }
                                    } else if (snapshot.hasError) {
                                      return const Center(
                                          child: Text('Ocurrio un error'));
                                    }
                                    return const RestaurantsShimmer();
                                  }),
                            ),
                          ],
                        )
                      : const SizedBox();
                }
              } else if (snapshot.hasError) {
                return const Center(child: Text('Ocurrio un error'));
              }
              return const RestaurantShimmer();
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: StreamBuilder<List<ProductModel>?>(
          stream: _restaurantViewModel.cartProductsOutput,
          builder: (_, snapshot) {
            int count = 0;
            final listProducts = snapshot.data;
            if (listProducts != null) {
              for (final product in listProducts) {
                count += product.quantity;
              }
            }
            return AnimatedOpacity(
                opacity: count > 0 ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: ElevatedButton.icon(
                    onPressed: () {
                      context
                          .push('${AppRoutes.restaurants}/${AppRoutes.restaurant}/${widget.restaurantId}/${AppRoutes.cart}');
                    },
                    icon: const Icon(Icons.shopping_cart_outlined),
                    label: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Comprar'),
                        Text(count.toString()),
                      ],
                    )));
          }),
    );
  }
}
