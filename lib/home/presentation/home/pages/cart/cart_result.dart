import 'package:user_cedtodo/home/domain/model/products_model.dart';
import 'package:user_cedtodo/startapp/presentation/results/generic_data_state.dart';

abstract class CartResult {}

class CartSuccess extends CartResult {
  final List<ProductModel>? productsModel;
  final GenericDataSate genericDataSate;

  CartSuccess(this.productsModel, this.genericDataSate);
}
