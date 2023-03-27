import 'package:user_cedtodo/home/domain/model/products_model.dart';
import 'package:user_cedtodo/startapp/presentation/results/generic_data_state.dart';

abstract class ProductsResult {}

class ProductsSuccess extends ProductsResult {
  final ProductsModel? productsModel;
  final GenericDataSate genericDataState;

  ProductsSuccess(
      {required this.productsModel, required this.genericDataState});
}
