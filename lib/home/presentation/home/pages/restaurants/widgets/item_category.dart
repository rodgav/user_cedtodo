import 'package:flutter/material.dart';
import 'package:user_cedtodo/home/domain/model/categories_model.dart';

class ItemCategory extends StatelessWidget {
  final CategoryDataModel categoryData;
  final CategoryDataModel? categoryDataSel;
  final VoidCallback callBackCategory;

  const ItemCategory(this.categoryData,
      {required this.categoryDataSel, required this.callBackCategory, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              color:
                  categoryData == categoryDataSel ? Colors.blue : Colors.grey)),
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: callBackCategory,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.extension),
            Text(categoryData.categoryModel.name)
          ],
        ),
      ),
    );
  }
}
