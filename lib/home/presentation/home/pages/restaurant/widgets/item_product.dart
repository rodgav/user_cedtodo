import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:user_cedtodo/home/domain/model/products_model.dart';
import 'package:user_cedtodo/home/presentation/home/pages/restaurant/restaurant_viewmodel.dart';

class ItemProduct extends StatelessWidget {
  final ProductDataModel _productDataModel;
  final RestaurantViewModel _restaurantViewModel;

  const ItemProduct(this._productDataModel, this._restaurantViewModel,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productModel = _productDataModel.productModel;
    return ListTile(
      leading: SizedBox(
        width: 48,
        height: 48,
        child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl:
                'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&w=1000&q=80',
            imageBuilder: (_, imageProvider) =>
                CircleAvatar(backgroundImage: imageProvider),
            errorWidget: (_, __, ___) => const Icon(Icons.warning)),
      ),
      title: Text(productModel.name),
      subtitle: Text(productModel.description, maxLines: 2),
      trailing: Ink(
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: InkWell(
            customBorder: const CircleBorder(),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: productModel.quantity <= 0 ? 30 : 80,
              child: productModel.quantity <= 0
                  ? const Icon(Icons.add_circle_outline)
                  : Container(
                      width: 80,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              child: Ink(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  child: InkWell(
                                    customBorder: const CircleBorder(),
                                    child:
                                        const Icon(Icons.remove_circle_outline),
                                    onTap: () {
                                      if (!(productModel.quantity <= 0)) {
                                        productModel.quantity -= 1;
                                        _restaurantViewModel
                                            .actionProductCart(productModel);
                                      }
                                    },
                                  ))),
                          Flexible(
                              child: Text(productModel.quantity.toString())),
                          Flexible(
                              child: Ink(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  child: InkWell(
                                    customBorder: const CircleBorder(),
                                    child: const Icon(Icons.add_circle_outline),
                                    onTap: () {
                                      productModel.quantity += 1;
                                      _restaurantViewModel
                                          .actionProductCart(productModel);
                                    },
                                  ))),
                        ],
                      ),
                    ),
            ),
            onTap: () {
              productModel.quantity += 1;
              _restaurantViewModel.actionProductCart(productModel);
            },
          )),
    );
  }
}
