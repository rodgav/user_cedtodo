import 'package:user_cedtodo/home/domain/model/categories_model.dart';

class CategoriesResult {
  final CategoriesModel categoriesModel;
  CategoryDataModel? categoryDataModel;

  CategoriesResult(
      {required this.categoriesModel, required this.categoryDataModel});
}
