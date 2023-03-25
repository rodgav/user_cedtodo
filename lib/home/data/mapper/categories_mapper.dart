import 'package:user_cedtodo/home/data/responses/categories_response.dart';
import 'package:user_cedtodo/home/domain/model/categories_model.dart';

const String empty = '';
const int zeroInt = 0;
const double zeroDouble = 0;
const iterableEmpty = Iterable.empty();
DateTime dateTime = DateTime.now();

extension CategoriesResponseMapper on CategoriesResponse? {
  CategoriesModel toDomain() {
    List<CategoryDataModel> categoriesDataModel =
        (this?.categoriesDataResponse?.map((e) => e.toDomain()) ??
                iterableEmpty)
            .cast<CategoryDataModel>()
            .toList();
    return CategoriesModel(
        categoriesDataModel: categoriesDataModel,
        total: this?.total ?? zeroInt);
  }
}

extension CategoryDataResponseMapper on CategoryDataResponse? {
  CategoryDataModel toDomain() => CategoryDataModel(
      categoryModel: this?.categoryResponse?.toDomain() ??
          CategoryModel(categoryId: empty, name: empty),
      collectionId: this?.collectionId ?? empty,
      databaseId: this?.databaseId ?? empty,
      createdAt: this?.createdAt ?? dateTime,
      updatedAt: this?.updatedAt ?? dateTime);
}

extension CategoryResponseMapper on CategoryResponse? {
  CategoryModel toDomain() =>
      CategoryModel(categoryId: this?.categoryId ?? empty, name: this?.name ?? empty);
}
