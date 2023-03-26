import 'package:user_cedtodo/home/domain/model/categories_model.dart';
import 'package:user_cedtodo/startapp/presentation/results/generic_data_state.dart';
import 'package:user_cedtodo/startapp/presentation/results/generic_result.dart';

abstract class CategoriesResult {}

class CategoriesSuccess extends CategoriesResult{
  final CategoriesModel? categoriesModel;
  final GenericDataSate genericDataSate;
  CategoryDataModel? categoryDataModel;

  CategoriesSuccess(
      {required this.categoriesModel,
      required this.genericDataSate,
      required this.categoryDataModel});
}
