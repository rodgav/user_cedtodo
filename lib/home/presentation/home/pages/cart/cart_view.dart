import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_cedtodo/home/presentation/home/pages/cart/cart_result.dart';
import 'package:user_cedtodo/home/presentation/home/pages/cart/cart_viewmodel.dart';
import 'package:user_cedtodo/main.dart';
import 'package:user_cedtodo/startapp/presentation/resources/dialogs/dialogs.dart';
import 'package:user_cedtodo/startapp/presentation/resources/routing/route.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final _cartViewModel = getIt<CartViewModel>();

  _bind() {
    _cartViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _cartViewModel.finish();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final result = await showDialogMessage(context, leftText: 'Cancelar',
            leftOnPressed: () {
          context.pop(false);
        }, rightText: 'Salir');
        await _cartViewModel.clearCart();
        return result;
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Ink(
              child: InkWell(
                customBorder: const CircleBorder(),
                child:
                    const Icon(Icons.arrow_back_ios_new, color: Colors.black54),
                onTap: () {
                  context.back();
                },
              ),
            ),
            title: const Text('cart', style: TextStyle(color: Colors.black)),
          ),
          body: StreamBuilder<CartResult?>(
              stream: _cartViewModel.cartResultOutput,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final cartResult = snapshot.data;
                  if (cartResult is CartSuccess) {
                    final productsModel = cartResult.productsModel;
                    return productsModel != null && productsModel.isNotEmpty
                        ? Scaffold(
                            body: ListView.separated(
                                itemBuilder: (_, index) {
                                  final productModel = productsModel[index];
                                  return ListTile(
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
                                    title: Text(productModel.name),
                                    subtitle: Text(productModel.description,
                                        maxLines: 2),
                                    trailing: Ink(
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle),
                                        child: InkWell(
                                          customBorder: const CircleBorder(),
                                          onTap: productModel.quantity <= 0
                                              ? () {
                                                  _cartViewModel.addProductCart(
                                                      productModel);
                                                }
                                              : null,
                                          child: AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            width: productModel.quantity <= 0
                                                ? 30
                                                : 80,
                                            child: productModel.quantity <= 0
                                                ? const Icon(
                                                    Icons.add_circle_outline)
                                                : Container(
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.blue),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Flexible(
                                                            child: Ink(
                                                                decoration: const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle),
                                                                child: InkWell(
                                                                  customBorder:
                                                                      const CircleBorder(),
                                                                  child: const Icon(
                                                                      Icons
                                                                          .remove_circle_outline),
                                                                  onTap: () {
                                                                    _cartViewModel
                                                                        .removeProductCart(
                                                                            productModel);
                                                                  },
                                                                ))),
                                                        Flexible(
                                                            child: Text(
                                                                productModel
                                                                    .quantity
                                                                    .toString())),
                                                        Flexible(
                                                            child: Ink(
                                                                decoration: const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle),
                                                                child: InkWell(
                                                                  customBorder:
                                                                      const CircleBorder(),
                                                                  child: const Icon(
                                                                      Icons
                                                                          .add_circle_outline),
                                                                  onTap: () {
                                                                    _cartViewModel
                                                                        .addProductCart(
                                                                            productModel);
                                                                  },
                                                                ))),
                                                      ],
                                                    ),
                                                  ),
                                          ),
                                        )),
                                  );
                                },
                                separatorBuilder: (_, index) => const Divider(),
                                itemCount: productsModel.length),
                            floatingActionButtonLocation:
                                FloatingActionButtonLocation.centerFloat,
                            floatingActionButton: Builder(builder: (context) {
                              double price = 0;
                              for (final product in productsModel) {
                                final priceProduct =
                                    product.quantity * product.price;
                                price += priceProduct;
                              }
                              return ElevatedButton.icon(
                                  onPressed: () {},
                                  icon:
                                      const Icon(Icons.shopping_cart_outlined),
                                  label: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text('Comprar'),
                                      Text(price.toStringAsFixed(2)),
                                    ],
                                  ));
                            }),
                          )
                        : const Center(child: Text('Ocurrio un error'));
                  }
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Ocurrio un error'));
                }
                return const Center(child: CircularProgressIndicator());
              })),
    );
  }
}
