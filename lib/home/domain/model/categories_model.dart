import 'package:user_cedtodo/home/domain/model/base_model.dart';

class CategoriesModel extends BaseTotalModel {
  final List<CategoryDataModel> categoriesDataModel;

  CategoriesModel({required this.categoriesDataModel, required int total})
      : super(total: total);
}

class CategoryDataModel extends BaseIdsModel {
  final CategoryModel categoryModel;

  CategoryDataModel(
      {required this.categoryModel,
      required String collectionId,
      required String databaseId,
      required DateTime createdAt,
      required DateTime updatedAt})
      : super(
            collectionId: collectionId,
            databaseId: databaseId,
            createdAt: createdAt,
            updatedAt: updatedAt);
}

class CategoryModel {
  final String categoryId;
  final String name;

  CategoryModel({required this.categoryId, required this.name});
}
